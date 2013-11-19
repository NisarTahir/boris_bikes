class Bike
  def initialize
    @break = false
    @fixed = false
  end
	
  def broken?
    @break
	end

  def fixed?
    @fixed
  end

  def break
    @break = true
  end

  def fix
    @break = false
    @fixed = true
  end
end