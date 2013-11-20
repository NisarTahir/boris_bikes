require './lib/bike_container.rb'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:holder) { ContainerHolder.new }
  let(:bike) { Bike.new }

  it "should have a container" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike from the container" do
    holder.release(bike)
    #expect(holder.bike_count).to eq(0)
  end

  it "should not allow more bikes to be stored than it's storage limit" do
    expect(holder).not_to be_limit_reached
    15.times {holder.dock(bike)}
    expect(holder).to be_limit_reached
    expect(holder.bike_count).to eq(15)
    holder.dock(bike)
    expect(holder).to be_limit_reached
    expect(holder.bike_count).to eq(15)
  end

  it "should return a list of bikes that are available, i.e.not broken" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end
end