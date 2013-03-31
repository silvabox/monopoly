require 'minitest/autorun'
require './lib/tile.rb'
require './lib/rule.rb'
require './lib/land_rule.rb'
require './lib/land_group.rb'
require './lib/land.rb'
require './lib/property.rb'
require './lib/board.rb'
require './lib/player.rb'
require './test/test_board.rb'

class PropertyTest < MiniTest::Unit::TestCase

  def setup
    @board = TestBoard.new
  end

  def test_rent_is_double_when_complete_group_owned
    player = Player.new("Player 1")
    property = nil
    @board.land_groups[:group1].land.each do |land|
      land.owner = player
      property = land
    end
    assert_equal property.rent_value * 2, property.calculate_rent
  end
end