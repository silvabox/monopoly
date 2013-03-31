require 'minitest/autorun'
require './lib/rule.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/penalty_rule.rb'

class PenaltyRuleTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new("Player 1")
  end

  def test_player_can_afford_penalty
    @player.initialize_balance 200
    rule = PenaltyRule.new(100, "Penalty 100")
    rule.apply(Turn.new(@player))
    assert_equal 100, @player.balance
  end

  def test_player_bankrupt_if_can_not_afford_penalty
    @player.initialize_balance 200
    rule = PenaltyRule.new(201, "Penalty 201")
    assert_throws(:bankrupt) { rule.apply(Turn.new(@player)) }
  end
end