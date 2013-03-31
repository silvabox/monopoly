require 'minitest/autorun'
require './lib/tile.rb'
require './lib/land.rb'
require './lib/property.rb'
require './lib/station.rb'
require './lib/rule.rb'
require './lib/land_rule.rb'
require './lib/penalty_rule.rb'
require './lib/bonus_rule.rb'
require './lib/card_draw.rb'
require './lib/community_chest.rb'
require './lib/land_group.rb'
require './lib/player.rb'
require './lib/board.rb'
require './lib/london_board.rb'

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
