require_relative 'bike'

class DockingStation
  attr_accessor :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY=20


  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
      @bikes.pop
  end

  def dock(bike)
    fail "Dock is full" if full?
      @bikes << bike
  end

  def bike
    @bikes
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
