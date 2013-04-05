class Turn
  attr_reader :player, :opponents, :dice

# when initialized with all players, turn derives the opponents
  def initialize(player, players = nil, dice = 0)
    @player, @dice = player, dice
    @opponents = players.reject { |p| p.bankrupt? || (p == player) } if players
  end

  def advance(places)
    @player.advance(places) do |tile|
      pass_go tile
    end
  end

  def pass_go(tile)
    if tile.name == Board::START_TILE_NAME
      @player.receive 200
      log "#{@player.name} passes Go and receives 200"
    end
  end
  private :pass_go

  def advance_to(tile_name, passes_go = true)
    @player.advance_until do |tile|
      pass_go(tile) if passes_go
      tile.name == tile_name
    end
  end

  def log(event)
    puts event
  end
end