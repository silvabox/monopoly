class Land < Tile
  attr_reader :purchase_value, :rent_value, :group
  attr_accessor :owner

  def initialize(name, purchase_value, rent_value, group)
    super(name)
    @buyable, @purchase_value = true, purchase_value
    @rent_value, @group = rent_value, group
    @group << self
  end

  def calculate_rent
    @owner ? @rent_value : 0
  end

  def available?
    !@owner
  end

  def to_s
    "Land #{@name}"
  end

end