require 'minitest/autorun'
require_relative '../london_board.rb'

class BoardTest < MiniTest::Unit::TestCase

  def setup
    @board = LondonBoard.new()
  end

  def test_london_board
    assert @board.go.name == "Go"
  end

  def test_kings_cross_station
    tile = advance(@board.go, 5)
    assert tile.name == "King's Cross Station"
  end

  def test_picadilly
    tile = advance(@board.go, 29)
    assert tile.name == "Piccadilly"
  end

  private

  def advance(tile, number_of)
    number_of.times do
      tile = tile.next
      yield(tile) if block_given?
    end
    tile
  end
end
