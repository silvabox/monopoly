require 'minitest/autorun'
require './lib/tile.rb'

class TileTest < MiniTest::Unit::TestCase
  def test_not_buyable_when_initialized
    refute Tile.new("Test").buyable?
  end

  def test_name_set_when_initialized
    assert_equal "Test", Tile.new("Test").name
  end
end