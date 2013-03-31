class Game
  def initialize(board)
    @board = board
    @players = []
  end

  def player(name, initial_balance)
    player = Player.new(name)
    player.initialize_balance(initial_balance)
    player.tile = @board.start_tile
    add_player player
  end

  def first_player
    @players.first
  end

  def remove_player(player)
    @players.delete player
    @players.each do |p|
      if p.next = player
        p.next = player.next
        break
      end
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
end