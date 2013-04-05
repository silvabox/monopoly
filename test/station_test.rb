require 'minitest/autorun'
require './lib/tile'
require './lib/rule'
require './lib/land_rule'
require './lib/land'
require './lib/land_group'
require './lib/station'


class StationTest < MiniTest::Unit::TestCase

	def setup
    @stations = LandGroup.new("Stations")
  end

  def test_name_when_initialized
    assert_equal "Station 1", new_station(1).name
  end

  def test_purchase_value_when_initialized
    assert_equal Station::PURCHASE_VALUE, new_station(1).purchase_value
  end


  def test_rent_value_when_initialized
    assert_equal Station::RENT_VALUE, new_station(1).rent_value
  end

  def test_calculate_rent_one_station_owned
    assert_equal Station::RENT_VALUES[1], add_stations(1)[0].calculate_rent
  end

  def test_calculate_rent_two_stations_owned
    stations = add_stations(2)
    assert_equal Station::RENT_VALUES[2], stations[0].calculate_rent
  end

  def test_calculate_rent_three_stations_owned
    stations = add_stations(3)
    assert_equal Station::RENT_VALUES[3], stations[0].calculate_rent
  end

  def test_calculate_rent_four_stations_owned
    stations = add_stations(4)
    assert_equal Station::RENT_VALUES[4], stations[0].calculate_rent
  end

  private

  def add_stations(no_of_owned)
    stations = []
    4.times do |i|
      station = new_station(i + 1)
      station.owner = "Owner" if no_of_owned > i
      stations << station
    end
    stations
  end

  def new_station(index)
    Station.new("Station #{index}", @stations)
  end
end
