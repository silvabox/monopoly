require 'minitest/autorun'
require './lib/tile'
require './lib/rule'
require './lib/land_rule'
require './lib/land_group'
require './lib/land'
require './lib/property'
require './lib/board'
require './lib/player'
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