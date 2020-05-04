class Oystercard
  
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if @balance == MAX_BALANCE || @balance + amount > MAX_BALANCE
        fail "Top up failed, maximum balance cannot exceed £90"
    else
        @balance += amount
        "Oystercard topped up by £#{amount}"
    end
  end
end
