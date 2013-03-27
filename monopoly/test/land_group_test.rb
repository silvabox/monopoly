require 'minitest/autorun'
require './lib/land_group.rb'

class LandGroupTest < MiniTest::Unit::TestCase
  def setup
    @group = LandGroup.new("Test")
  end

  def test_name_when_initialized
    assert_equal "Test", @group.name
  end

  def test_add_land
    @group <<  "Land"
    assert_includes @group.land, "Land"
  end

end