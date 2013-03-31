require 'minitest/autorun'
require './lib/tile.rb'
require './lib/land_group.rb'
require './lib/land.rb'
require './lib/property.rb'
require './lib/player.rb'
require './lib/rule.rb'
require './lib/land_rule.rb'
require './lib/board.rb'
require './lib/game.rb'
require './test/test_board.rb'

class LandRuleTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new("Player 1")
    @land = Land.new("Test Land", 200, 50, LandGroup.new("Test Group"))
  end

  def test_player_buys_land_if_available
    @player.initialize_balance 200
    rule = LandRule.new(@land)
    rule.apply(@player)
    assert_equal @player, @land.owner
  end

  def test_player_does_not_buy_land_if_not_available
    @player.initialize_balance 200
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    rule.apply(@player)
    refute_equal @player, @land.owner
  end

  def test_player_does_not_buy_land_if_already_owns
    @player.initialize_balance 200
    @land.owner = @player
    rule = LandRule.new(@land)
    rule.apply(@player)
    assert_equal 200, @player.balance
  end

  def test_player_does_not_buy_land_if_can_not_afford
    @player.initialize_balance 199
    rule = LandRule.new(@land)
    rule.apply(@player)
    refute_equal @player, @land.owner
  end

  def test_player_pays_rent_if_land_owned
    @player.initialize_balance 200
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    rule.apply(@player)
    assert_equal 50, @land.owner.balance
  end

  def test_player_bankrupt_if_can_not_afford_rent
    @player.initialize_balance 49
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    assert_throws(:bankrupt) { rule.apply(@player) }
  end
end