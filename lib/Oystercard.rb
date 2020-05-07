class Oystercard
  
  attr_reader :balance, :entry_station, :exit_station, :journeys
 
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @journeys = {}
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
  
  def touch_in(entry_station)
    if @balance < MIN_BALANCE
      fail "Insufficient funds, balance is: £#{@balance}, please top up"
    else 
      @journeys.merge!(Entry_station: entry_station)
      @in_use = true 
      @entry_station = entry_station
    end
  end
  
  def touch_out(exit_station)
    @journeys.merge!(Exit_station: exit_station)
    @in_use = false
    @exit_station = exit_station
    deduct(MIN_FARE)
  end

  private
  
  def deduct(amount)
    @balance -= amount
    "Oystercard deducted by £#{amount}"
  end
end
