class Oystercard

    MINIMUM_FARE = 1

    MAXIMUM_BALANCE = 90

    attr_reader :balance, :entry_station, :journey_history

    def initialize
      @balance = 0
      @journey_history = []
    end

    def top_up(amount)
      fail "You cannot exceed #{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end


    def in_journey?
      @entry_station != nil
    end

    def touch_in(station)
      fail "You have insufficient funds" if check_balance
      @entry_station = station
    end

    def check_balance
      @balance < MINIMUM_FARE 
    end

    def touch_out(station)
      deduct
      @journey_history << { start: @entry_station, finish: station }
      @entry_station = nil
    end

    private

    def deduct(amount = MINIMUM_FARE)
      @balance -= amount
    end

end