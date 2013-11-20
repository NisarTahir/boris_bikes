require './lib/dockingstation.rb'

describe DockingStation do
  
  let(:station) { DockingStation.new(:capacity => 15) }

  it "should have a default value of 15" do
    expect(station.capacity(15)).to eq(15)
  end
end