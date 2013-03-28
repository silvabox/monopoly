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
    player
  end

  def first_player
    @players.first
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