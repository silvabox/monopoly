class Dice
  def initialize(no_of_dice)
    @no_of_dice = no_of_dice
    @rand = Random.new
    self.roll!
  end

  def roll!
    @roll = roll
  end

  def total
    @roll.inject(0) {|sum, x| sum + x }
  end

  def double?
    return false if @no_of_dice < 2
    @roll.uniq.count == 1
  end

  def new_total!
    roll!
    total
  end

  private

  def roll
    Array.new(@no_of_dice) { @rand.rand(1..6) }
  end


end