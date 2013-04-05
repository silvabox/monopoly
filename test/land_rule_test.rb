require 'minitest/autorun'
require './lib/tile'
require './lib/land_group'
require './lib/land'
require './lib/property'
require './lib/player'
require './lib/rule'
require './lib/turn'
require './lib/land_rule'
require './lib/board'
require './lib/game'
require './test/test_board.rb'

class LandRuleTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new("Player 1", 200)
    @turn = Turn.new(@player)
    @land = Land.new("Test Land", 200, 50, LandGroup.new("Test Group"))
  end

  def test_player_buys_land_if_available
    rule = LandRule.new(@land)
    rule.apply(@turn)
    assert_equal @player, @land.owner
  end

  def test_player_does_not_buy_land_if_not_available
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    rule.apply(@turn)
    refute_equal @player, @land.owner
  end

  def test_player_does_not_buy_land_if_already_owns
    @land.owner = @player
    rule = LandRule.new(@land)
    rule.apply(@turn)
    assert_equal 200, @player.balance
  end

  def test_player_does_not_buy_land_if_can_not_afford
    @player.instance_variable_set(:@balance, 199)
    rule = LandRule.new(@land)
    rule.apply(@turn)
    refute_equal @player, @land.owner
  end

  def test_player_pays_rent_if_land_owned
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    rule.apply(@turn)
    assert_equal 50, @land.owner.balance
  end

  def test_player_bankrupt_if_can_not_afford_rent
    @player.instance_variable_set(:@balance, 49)
    @land.owner = Player.new("Player 2")
    rule = LandRule.new(@land)
    rule.apply @turn
    assert_equal true, @player.bankrupt?
  end
end