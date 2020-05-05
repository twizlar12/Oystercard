class Oystercard
  
  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    if @balance == MAX_BALANCE || @balance + amount > MAX_BALANCE
        fail "Top up failed, maximum balance cannot exceed £90"
    else
        @balance += amount
        "Oystercard topped up by £#{amount}"
    end
  end

  
  def in_journey?
    if @in_use
      true
    else
      false
    end
  end
  
  def touch_in(station)
    if @balance < MIN_BALANCE
      fail "Insufficient funds, balance is: £#{@balance}, please top up"
    else 
      @in_use = true 
      @entry_station = station
    end
  end
  
  def touch_out
    @in_use = false
    deduct(MIN_FARE)
  end

  private
  
  def deduct(amount)
    @balance -= amount
    "Oystercard deducted by £#{amount}"
  end
end
