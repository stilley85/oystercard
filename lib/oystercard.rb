class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Too much! The limit is #{MAX_BALANCE}" if over_max?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def over_max?(amount)
    @balance + amount > MAX_BALANCE
  end

end
