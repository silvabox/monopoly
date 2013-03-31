require 'minitest/autorun'
require './lib/rule.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/bonus_rule.rb'

class BonusRuleTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new("Player 1")
  end

  def test_player_receives_bonus
    @player.initialize_balance 200
    rule = BonusRule.new(100, "Bonus 100")
    rule.apply(Turn.new(@player))
    assert_equal 300, @player.balance
  end
end