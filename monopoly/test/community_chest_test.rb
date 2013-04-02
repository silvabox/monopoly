require 'minitest/autorun'
require './lib/rule.rb'
require './lib/penalty_rule.rb'
require './lib/bonus_rule.rb'
require './lib/turn.rb'
require './lib/card_draw.rb'
require './lib/community_chest.rb'
require './lib/player.rb'

class CommunityChestTest < MiniTest::Unit::TestCase

  def setup
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2", 10)
    @turn = Turn.new(@player1, [@player1, @player2] )
  end

  def test_card_1
    CommunityChest.cards[0].apply(@turn)
    assert_equal 10, @player1.balance
  end

  def test_card_2_2_players
    CommunityChest.cards[1].apply(@turn)
    assert_equal 10, @player1.balance
    assert_equal 0, @player2.balance
  end

  def test_card_2_3_players
    player3 = Player.new("Player 3", 10)
    @turn.opponents << player3

    CommunityChest.cards[1].apply(@turn)
    assert_equal 20, @player1.balance
    assert_equal 0, @player2.balance
    assert_equal 0, player3.balance
  end
end