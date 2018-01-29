class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
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

  def in_journey?
    @in_journey
  end

end
