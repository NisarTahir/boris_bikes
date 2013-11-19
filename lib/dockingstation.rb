require 'Bike'

class DockingStation

  def initialize(options = {})
    @bikes = []
    @station_limit = options.fetch(:station_limit)
  end

  def bike_count
    @bikes.count
  end

  def dock(bike)
    if !limit_reached?
      @bikes << bike
    end
  end

  def release(bike)
    @bikes.delete bike
  end

  def limit_reached?
    if bike_count >= 15 && @station_limit >= 15
      true
    end 
  end

  def available_bikes
    @bikes.reject {|bike| bike.broken?}
  end

end