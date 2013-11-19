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
  end
end