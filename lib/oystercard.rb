require_relative 'journey'
require_relative 'station'

class Oystercard

    MINIMUM_FARE = 1

    MAXIMUM_BALANCE = 90

    attr_reader :balance, :journey_history, :journey

    def initialize
      @balance = 0
      @journey_history = []
    end

    def top_up(amount)
      fail "You cannot exceed #{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def in_journey?
      if @journey == nil || @journey.complete?
        false
      else
        true
      end
    end

    def touch_in(station)
      fail "You have insufficient funds" if check_balance
      @journey = Journey.new(station)
    end

    def check_balance
      @balance < MINIMUM_FARE 
    end

    def touch_out(station)
      @journey.finish(station)
      deduct(@journey.fare)
      @journey_history << { start: @journey.entry_station, finish: @journey.exit_station }
      @journey = nil
    end

    private

    def deduct(amount)
      @balance -= amount
    end

end