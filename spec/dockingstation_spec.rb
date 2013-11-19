require './lib/dockingstation.rb'

describe DockingStation do
  
  let(:station) { DockingStation.new }
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
end