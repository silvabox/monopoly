require 'minitest/autorun'
require '../game.rb'

class TestGame < MiniTest::Unit::TestCase
  def test_add_land_set
    game = Game.new()
    game.land_set :test, "Test Land Set"
    assert game.land_set(:test).name == "Test Land Set"
  end

  def test_add_first_player
    game = Game.new()
    game.player "Player 1", 2500
    assert game.first_player.name == "Player 1"
  end

  def test_first_player_cycle
    game = Game.new()
    game.player "Player 1", 2500
    assert game.first_player.next == game.first_player
  end
end
