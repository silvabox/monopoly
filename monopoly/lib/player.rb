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
    raise "This land cannot be bought" unless land.buyable?
    raise "This land is already owned" if land.owner
    raise "Insufficient funds to buy land" unless can_afford? land.purchase_value

    @balance -= land.purchase_value
    land.owner = self
    @land << land
  end

  def pay_rent(land)
    rent = land.calculate_rent
    pay rent
    land.owner.receive rent
  end

  def receive(amount)
    @balance += amount
  end

  def pay(amount)
    raise "Insufficient funds to pay amount" unless can_afford? amount

    @balance -= amount
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