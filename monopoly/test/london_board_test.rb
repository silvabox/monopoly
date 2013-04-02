require 'minitest/autorun'
require './lib/tile'
require './lib/land'
require './lib/property'
require './lib/station'
require './lib/rule'
require './lib/land_rule'
require './lib/penalty_rule'
require './lib/bonus_rule'
require './lib/card_draw'
require './lib/community_chest'
require './lib/land_group'
require './lib/player'
require './lib/board'
require './lib/london_board'

class LondonBoardTest < MiniTest::Unit::TestCase

  def setup
    @board = LondonBoard.new()
    @player = Player.new("Player 1")
  end

  def test_london_board
    assert @board.start_tile.name == Board::START_TILE_NAME
  end

  def test_kings_cross_station
    assert_equal "King's Cross Station", advance(@board.start_tile, 5).name
  end

  def test_picadilly
    assert_equal "Piccadilly", advance(@board.start_tile, 29).name
  end

  def super_tax
    @player.initialize_balance 200
    tile = advance(@board.start_tile, 2)
    tile.rule.apply(@person)
    assert_eqaul 0, person.balance
  end

  def income_tax
    @player.initialize_balance 100
    tile = advance(@board.start_tile, 2)
    tile.rule.apply(@person)
    assert_eqaul 0, person.balance
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
