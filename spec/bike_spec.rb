require './lib/bike.rb'

describe Bike do
	it "should not be broken after it has been created" do
		bike = Bike.new
	  expect(bike).not_to be_broken
	end

  it "should be broken after we create it" do
    bike = Bike.new
    bike.break
    expect(bike).to be_broken
  end
end
