class Journey
  PENALTY_FARE = 6
  attr_reader :entry_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def complete?

  end

  def fare(amount = PENALTY_FARE)
    amount
  end

  def finish(station)
    self
  end
end