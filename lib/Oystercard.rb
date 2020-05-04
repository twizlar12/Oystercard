class Oystercard
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
    "Oystercard topped up by £#{amount}"
  end

end
