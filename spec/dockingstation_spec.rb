require './lib/dockingstation.rb'

describe DockingStation do
  
  let(:station) { DockingStation.new(:station_limit => 15) }
  let(:bike) { Bike.new }

  it "should have a docking station" do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it "should release a bike from the docking station" do
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should not allow more bikes to be stored than it's storage limit" do
    expect(station).not_to be_limit_reached
    15.times {station.dock(bike)}
    expect(station).to be_limit_reached
    expect(station.bike_count).to eq(15)
    station.dock(bike)
    expect(station).to be_limit_reached
    expect(station.bike_count).to eq(15)
  end

  it "should return a list of bikes that are available, i.e.not broken" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end
end