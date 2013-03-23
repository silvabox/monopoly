require "./land.rb"

class Player
  attr_reader :name, :balance, :land, :next
  attr_accessor :tile

  def initialize(name)
    @name = name
    @balance = 0
    @land = []
  end

  def next=(player)
    @next = player
  end

  def initialize_balance(balance)
    @balance = balance
  end

  def owns_complete_set?(land)
    land_owned_in_set(land).count == land.set.count
  end

  def land_owned_in_set(land)
    land.set.land_owned_by(self)
  end

  def buy(land)
    raise "This land cannot be bought" unless land.buyable?
    raise "This land is already owned" if land.owner
    raise "Insufficient funds to buy land" if @balance  < land.purchase_value

    @balance -= land.purchase_value
    land.owner = self
    @land << land
  end

  def to_s
    "Player #{@name}"
  end
end