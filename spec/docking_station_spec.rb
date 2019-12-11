require 'docking_station'

describe DockingStation do
  it "Starts with 20 bikes in docking station" do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect{subject.dock(bike)}.to raise_error("Dock is full")
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
    expect(subject.bike).to eq [bike]
  end

end
