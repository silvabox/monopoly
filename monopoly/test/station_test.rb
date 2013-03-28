require 'minitest/autorun'
require './lib/tile.rb'
require './lib/land.rb'
require './lib/land_group.rb'

class StationTest < MiniTest::Unit::TestCase
	def setup
    @stations = LandGroup.new()
  end

  def test_name_when_initialized
    station = add_stations(1)
    assert_equal "Station 1", station
  end

  def test_purchase_value_when_initialized
    station = add_stations(1)
    assert_equal station::PURCHASE_VALUE, station.purchase_value
  end


  def test_rent_value_when_initialized
    station = add_stations(1)
    assert_equal station::RENT_VALUE, station.rent_value
  end

  def test_calculate_rent_one_station
    station = add_stations(1)
    assert_equal station::RENT_VALUE_ONE_STATION, station.rent_value
  end

  def test_calculate_rent_two_stations
    station = add_stations(2)
    assert_equal station::RENT_VALUE_TWO_STATION, station.rent_value
  end

  def test_calculate_rent_three_station
    station = add_stations(3)
    assert_equal station::RENT_VALUE_THREE_STATION, station.rent_value
  end

  def test_calculate_rent_four_station
    station = add_stations(4)
    assert_equal station::RENT_VALUE_FOUR_STATION, station.rent_value
  end

  private

  def add_stations(no_of_stations)
    stations = []
    no_of_stations.times do |i|
      stations << Station.new("Station #{i}", @stations)     
    end
    no_of_stations > 1 ? stations : stations[1] 
  end
end
