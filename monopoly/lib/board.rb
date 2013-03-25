require_relative "./game.rb"

class Board

  def start_tile
    @tiles[0]
  end

  def land_groups
    @groups
  end

  protected

  def initialize(start_tile)
    @tiles = [start_tile]
    @groups = {}
    self.build
  end

# this method is called in the constructor and overriden in sub classes to build the board
  def build

  end

# the following are convenience methods to helo build a board using 'DSL'
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

private

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