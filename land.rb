require "./tile.rb"

class Land < Tile
  attr_reader :purchase_value, :rent_value, :set
  attr_accessor :owner

  def initialize(name, purchase_value, rent_value, set)
    super(name)
    @buyable = true
    @purchase_value = purchase_value
    @rent_value = rent_value
    @set = set
    @set.add self

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