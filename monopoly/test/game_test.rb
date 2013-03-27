require 'minitest/autorun'
require './lib/game.rb'

class GameTest < MiniTest::Unit::TestCase

  def setup
    @game = Game.new(Go.new)
  end

  def test_add_land_group
    group = @game.land_group(:test, "Test Land Group")
    assert @game.land_groups[:test] == group
  end

  def test_add_first_player
    player = add_players(1)
    assert @game.first_player == player
  end

  def test_first_player_cycle
    player = add_players(1)
    assert @game.first_player.next == player
  end

  def test_two_player_cycle
    players = add_players(2)
    assert @game.first_player.next == players[1]
    assert players[1].next == @game.first_player
  end

private

# return a single player if number_of is 1.  Otherwise return an array of players
  def add_players(number_of)
    return @game.player("Player 1", 2500) if number_of == 1

    Array.new(number_of) do |i|
      @game.player "Player #{i}", 2500
    end
  end
end
