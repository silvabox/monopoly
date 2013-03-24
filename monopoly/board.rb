require_relative "./game.rb"
require_relative "./go.rb"

class Board

  def go
    @tiles[0]
  end

  def land_groups
    @groups
  end

  protected

  def initialize()
    @tiles = [Go.new]
    @groups = {}
    self.build
  end

  def build

  end

  def land_group(key, value)
    group = LandGroup.new(value)
    @groups[key] = group
    group
  end

  def tile(name)
    tile = Tile.new(name)
    add_tile tile
    tile
  end

  def property(name, purchase_value, rent_value, group_key)
    group = @groups[group_key]
    property = Property.new(name, purchase_value, rent_value, group)
    add_tile(property)
    property
  end

  def station(name)
    station = Station.new(name)
    add_tile(station)
    station
  end

  def add_tile(tile)
    unless @tiles.empty?
      tile.next = @tiles.first
      @tiles.last.next = tile
    else
      tile.next = tile
    end
    @tiles << tile
    tile
  end
end