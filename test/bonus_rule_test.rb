require 'minitest/autorun'
require './lib/rule'
require './lib/player'
require './lib/turn'
require './lib/bonus_rule'

class BonusRuleTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new("Player 1", 200)
  end

  def test_player_receives_bonus
    rule = BonusRule.new(100, "Bonus 100")
    rule.apply(Turn.new(@player))
    assert_equal 300, @player.balance
  end
end