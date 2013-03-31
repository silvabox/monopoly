class Board

  START_TILE_NAME = "Go"
  STATIONS_GROUP_NAME = "Stations"

  def start_tile
    @tiles[0]
  end

  def land_groups
    @groups
  end

  protected

  def initialize()
    @tiles = []
    tile START_TILE_NAME
    @groups = {}
    land_group :stations, STATIONS_GROUP_NAME
    self.build
  end
  
# this method is called in the constructor and overriden in sub classes to build the board
  def build

  end

# the following are convenience methods to help build a board using 'DSL'
  def land_group(key, name)
    group = LandGroup.new(name)
    @groups[key] = group
    group
  end

  def tile(name)
    add_tile Tile.new(name)
  end

  def penalty_tile(name, penalty)
    tile = Tile.new(name)
    tile.rule = PenaltyRule.new(penalty, name)
    add_tile tile
  end

  def property(name, purchase_value, rent_value, group_key)
    add_tile Property.new(name, purchase_value, rent_value, @groups[group_key])
  end

  def station(name)
    add_tile Station.new(name, stations)
  end

  def community_chest
    tile = Tile.new("Community Chest")
    tile.rule = CommunityChest
    add_tile tile
  end

  def chance
    tile = Tile.new("Chance")
    # tile.rule = Chance
    add_tile tile
  end

private

  def stations
    @groups[:stations]
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