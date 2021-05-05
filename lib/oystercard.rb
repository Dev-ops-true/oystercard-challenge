class Oystercard

    MINIMUM_FARE = 1

    MAXIMUM_BALANCE = 90

    attr_reader :balance

    def initialize
      @balance = 0
     @status = false
    end

    def top_up(amount)
      fail "You cannot exceed #{MAXIMUM_BALANCE}" if amount + @balance > MAXIMUM_BALANCE
      @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end


    def in_journey?
        @status
    end

    def touch_in
      fail "You have insufficient funds" if check_balance
      @status = true
    end

    def check_balance
      @balance < MINIMUM_FARE 
    end

    def touch_out
      deduct
      @status = false
    end

    private

    def deduct(amount = MINIMUM_FARE)
      @balance -= amount
    end

end