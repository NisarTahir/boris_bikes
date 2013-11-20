module BikeContainer

  DEFAULT_CAPACITY = 15

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity  ||= DEFAULT_CAPACITY
  end

  def capacity(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    if !limit_reached?
      @bikes << bike
    end
  end

  def release(bike)
    bikes.delete bike
  end

  def limit_reached?
    if bike_count >= 15 && DEFAULT_CAPACITY >= 15
      true
    end 
  end

  def available_bikes
    @bikes.reject {|bike| bike.broken?}
  end
end