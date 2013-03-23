require "./tile_set"

class LandSet < TileSet
  attr_reader :name, :land

  include Enumerable

  def initialize(name)
    @name = name
    @land = []
  end

  def add(land)
    @land << land
  end

  def each
    @land.each { |x| yield x }
  end

  def land_owned_by(owner)
    @land.select { |land| land.owner == owner }
  end
end