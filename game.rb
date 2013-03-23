require "./property.rb"
require "./station.rb"
require "./land_set.rb"
require "./player.rb"

class Game
  def initialize
    @players = []
    @tiles = []
    @sets = {}
  end

  def land_set(key, value)
    @sets[key] = LandSet.new(value)
  end

  def tile(name)
    tile = Tile.new(name)
    add_tile tile
  end

  def player(name, initial_balance)
    player = Player.new(name)
    player.initialize_balance(initial_balance)
    player.tile = @tiles.first
    add_player player
  end

  def property(name, purchase_value, rent_value, set_key)
    set = @sets[set_key]
    property = Property.new(name, purchase_value, rent_value, set)
    add_tile(property)
  end

  def station(name)
    station = Station.new(name)
    add_tile(station)
  end

  def first_player
    @players.first
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

  def add_player(player)
    unless @players.empty?
      player.next = @players.first
      @players.last.next = player
    else
      player.next = player
    end
    @players << player
    player
  end
end