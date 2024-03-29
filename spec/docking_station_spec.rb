require 'docking_station'

describe DockingStation do
  let(:bike) { double(:report_broken => false, :working? => false) }

    # other tests omitted for brevity
describe "initialise works" do
    it "has a default capacity of 20" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "allows a default value of 30 to be defined" do
      docking_station = DockingStation.new(30)
      expect(docking_station.capacity).to eq 30
    end
end


  it "Fails when docking 31st bike when starts with 30 bikes in docking station" do
    docking_station = DockingStation.new(30)
    docking_station.capacity.times { docking_station.dock(bike) }
    expect{docking_station.dock(bike)}.to raise_error("Dock is full")
  end

  it { is_expected.to respond_to :release_bike }

  it 'raises error on .release_bike when docking station is empty' do
    expect { subject.release_bike } .to raise_error("No working bikes available")
  end

  it "Does release a working bike when there is a broken bike" do
    bike.report_broken
    subject.dock(bike)
    bike2 = double(:bike)
    allow(bike2).to receive(:working?).and_return(true)
    subject.dock(bike2)
    expect(subject.release_bike).to eq bike2
  end

  it "fails if all bikes in a station are broken" do
    bike.report_broken
    10.times{subject.dock(bike)}
    expect{subject.release_bike} .to raise_error("No working bikes available")
  end


  it 'releases working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'dock second bike' do
    subject.dock(bike)
    expect(subject.dock(bike)).to eq [bike, bike]
  end

  it 'docks something' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

end
