class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Too much!" if over_max?(amount)
    @balance += amount
  end

  private

  def over_max?(amount)
    @balance + amount > MAX_BALANCE
  end

end
