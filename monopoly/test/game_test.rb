require 'minitest/autorun'
require './lib/tile.rb'
require './lib/land_group.rb'
require './lib/land.rb'
require './lib/property.rb'
require './lib/player.rb'
require './lib/board.rb'
require './lib/game.rb'
require './test/test_board.rb'

class GameTest < MiniTest::Unit::TestCase

  def setup
    @game = Game.new(TestBoard.new)
  end

  def test_add_first_player
    player = add_players(1)
    assert_equal player, @game.first_player
  end

  def test_first_player_name
    player = add_players(1)
    assert_equal "Player 1", player.name
  end

  def test_first_player_initial_balance
    player = add_players(1)
    assert_equal 1500, player.balance
  end

  def test_first_player_cycle
    player = add_players(1)
    assert_equal player, @game.first_player.next
  end

  def test_two_player_cycle
    players = add_players(2)
    assert_equal players[1], @game.first_player.next
    assert_equal @game.first_player, players[1].next 
  end

private

# return a single player if number_of is 1.  Otherwise return an array of players
  def add_players(number_of)
    return @game.player("Player 1", 1500) if number_of == 1

    Array.new(number_of) do |i|
      @game.player "Player #{i}", 2500
    end
  end
end
