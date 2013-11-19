require './lib/dockingstation.rb'

describe DockingStation do
  it "should have a docking station" do
    station = DockingStation.new
    bike = Bike.new
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end
end