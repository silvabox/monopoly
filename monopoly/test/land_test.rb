require 'minitest/autorun'
require './lib/tile.rb'
require './lib/land.rb'
require './lib/land_group.rb'

class LandTest < MiniTest::Unit::TestCase
  def setup
    @group = LandGroup.new("Test Group")
    @land = Land.new("Test", 1000, 50, @group)
  end

  def test_purchase_value_when_initialized
  	assert_equal 1000, @land.purchase_value
  end

  def test_rent_value_when_initialized
  	assert_equal 50, @land.rent_value
  end

  def test_group_when_initialized
  	assert_equal @group, @land.group
  end

  def test_group_contains_land_when_land_initialized
  	assert_includes @group.land, @land
  end

  def test_available_when_initialized
  	assert_equal true, @land.available?
  end

  def test_calculate_rent_when_not_owned
    assert_equal 0, @land.calculate_rent
  end

  def test_calculate_rent_when_owned
  	@land.owner = "Owner"
    assert_equal 50, @land.calculate_rent
  end

  def test_not_available_when_owned
  	@land.owner = "Owner"
    assert_equal false, @land.available?
  end
end