require './lib/bike.rb'

describe Bike do
  
  let(:bike) { Bike.new}

	it "should not be broken after it has been created" do
	  expect(bike).not_to be_broken
	end

  it "should be broken after we create it" do
    bike.break
    expect(bike).to be_broken
  end

  it "should be fixed after the bike has been created" do
    bike.break
    bike.fix
    expect(bike).not_to be_broken
  end
end
