class Dice
  def initialize(no_of_dice)
    @no_of_dice = no_of_dice
    @rand = Random.new()
    self.roll!
  end

  def roll!
    @roll = Array.new(@no_of_dice) { @rand.rand(1..6) }
  end

  def total
    total = 0
    @roll.each { |value| total += value }
    total
  end

  def double?
    return false if @no_of_dice < 2

    values = []
    @roll.each do |value|
      return true if values.include?(value)
      values << value
    end
    false
  end

  def new_total!
    roll!
    total
  end

end