require 'minitest/autorun'
require './lib/tile'
require './lib/land_group'
require './lib/land'

class LandGroupTest < MiniTest::Unit::TestCase
  def setup
    @group = LandGroup.new("Test")
  end

  def test_name_when_initialized
    assert_equal "Test", @group.name
  end

  def test_land_owned_by
    owner = "Owner"
    land1 = Land.new("Test 1", 1000, 50, @group)
    land2 = Land.new("Test 2", 1000, 50, @group)
    land3 = Land.new("Test 3", 1000, 50, @group)
    land1.owner = owner
    land3.owner = owner
    assert_equal [land1, land3], @group.land_owned_by(owner)
  end
end