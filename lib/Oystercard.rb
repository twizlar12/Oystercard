class Oystercard
  
  attr_reader :balance

  MAX_BALANCE = 90

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

  def deduct(amount)
    if @balance <= 0
      fail "Failed, your balance is £#{@balance}"
    else
      @balance -= amount
      "Oystercard deducted by £#{amount}"
    end
  end

  def in_journey?
    if @in_use
      true
    else
      false
    end
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end
  
end
