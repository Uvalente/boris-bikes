require 'docking_station'

describe DockingStation do

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
    bike = Bike.new
    docking_station.capacity.times { docking_station.dock(bike) }
    expect{docking_station.dock(bike)}.to raise_error("Dock is full")
  end

  it { is_expected.to respond_to :release_bike }

  it 'raises error on .release_bike when docking station is empty' do
    expect { subject.release_bike } .to raise_error("No bikes available")
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'dock second bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.dock(bike)).to eq [bike, bike]
  end

  it 'docks something' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

end
