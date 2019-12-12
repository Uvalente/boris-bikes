class Bike
  def initialize
    @status = true
  end

  def working?
    @status
  end

  def report_broken
    @status = false
  end
end
