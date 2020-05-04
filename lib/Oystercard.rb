class Oystercard
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    if @balance == 90 || @balance + amount > 90
        fail "Top up failed, maximum balance cannot exceed £90"
    else
        @balance += amount
        "Oystercard topped up by £#{amount}"
    end
  end
end
