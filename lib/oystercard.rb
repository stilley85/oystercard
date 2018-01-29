class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

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

  def touch_in
    raise "insufficient funds" if insufficient_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def over_max?(amount)
    @balance + amount > MAX_BALANCE
  end

  def in_journey?
    @in_journey
  end

  def insufficient_funds?
    @balance < MIN_FARE
  end

end
