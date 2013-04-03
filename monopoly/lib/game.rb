class Game
  def initialize(board)
    @board = board
    @players = []
  end

  def player(name, initial_balance)
    player = Player.new(name, initial_balance)
    player.tile = @board.start_tile
    add_player player
  end

  def first_player
    @players.first
  end

  def remove_player(player)
    @players.delete player

    if previous_player = find_previous_player(player)
      previous_player.next = player.next
    end
  end

  def player_count
    @players.count
  end

  def players
    @players
  end

  private

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

  def find_previous_player(player)
    @players.find { |p| p.next == player }
  end
end