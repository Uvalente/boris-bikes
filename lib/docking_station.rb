# frozen_string_literal: true

require_relative 'bike'

class DockingStation
  attr_accessor :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No working bikes available' if empty?

    select_working.pop
  end

  def dock(bike)
    raise 'Dock is full' if full?

    @bikes << bike
  end

  def load_broken_bikes
    broken_array = select_broken
    @bikes -= select_broken
    broken_array
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    select_working.empty?
  end

  def select_working
    @bikes.select(&:working?)
  end

  def select_broken
    @bikes.reject(&:working?)
  end
end
