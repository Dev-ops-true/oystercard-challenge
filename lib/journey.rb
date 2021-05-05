class Journey
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    @entry_station != nil && @exit_station != nil ? 1 : 6
    
  end

  def finish(station = nil)
    @exit_station = station
    self
  end
end