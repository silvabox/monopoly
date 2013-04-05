class Player
  attr_reader :name, :balance, :land, :next
  attr_accessor :tile

  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @land = []
    @bankrupt = false
  end

  def next=(player)
    @next = player
  end

  def owns_complete_group?(land)
    land_owned_in_group(land).count == land.group.land.count
  end

  def land_owned_in_group(land)
    land.group.land_owned_by(self)
  end

  def can_afford?(amount)
    @balance >= amount
  end

  def buy(land)
    buy! land
  rescue
    false
  end

  def buy!(land)
    raise "This land cannot be bought" unless land.buyable?
    raise "This land is already owned" if land.owner

    pay! land.purchase_value

    land.owner = self
    @land << land
    true
  end

  def pay_rent(land)
    rent = land.calculate_rent
    # owner should only receive what player can afford
    land.owner.receive pay(rent)
  end

  def receive(amount)
    @balance += amount
  end

# if the player cannot afford to pay the full amount
# they become bankrupt and only pay what they have left
  def pay(amount)
    if can_afford? amount
      @balance -= amount
    else
      amount = balance
      @balance = 0
      @bankrupt = true
    end 
    amount
  end

  def pay!(amount)
    raise "Insufficient funds to pay amount" unless can_afford? amount

    @balance -= amount
  end

  def bankrupt?
    @bankrupt
  end

  def advance(places)
    places.times do
      @tile = @tile.next
      yield(@tile) if block_given?
    end
    @tile
  end

  def advance_until()
    return unless block_given?

    while true do
      @tile = @tile.next
      break if yield(@tile)
    end
    @tile
  end

  def to_s
    "Player #{@name}"
  end
end