class Bike
  def initialize
    @break = false
  end
	
  def broken?
    @break
	end

  def break
    @break = true
  end

end