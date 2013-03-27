require 'minitest/autorun'
require 'mocha/setup'
require './lib/dice'

class DiceTest < MiniTest::Unit::TestCase

  def setup
    @one_dice = Dice.new(1)
    @two_dice = Dice.new(2)
  end

  def test_starts_with_an_initial_roll
      stub_randomizer.returns(6)
      assert_equal 6, Dice.new(1).outcome
  end

  def test_roll_one_dice
    stub_randomizer.returns(3)
    assert_equal 3, @one_dice.roll!.outcome
  end

  def test_roll_two_dice
    stub_randomizer.returns(3, 4)
    assert_equal [3,4], @two_dice.roll!.outcome
  end

  def test_roll_double
    stub_randomizer.returns(3, 3)
    assert @two_dice.roll!.double?
  end

  def test_roll_not_double
    stub_randomizer.returns(3, 4)
    refute @two_dice.roll!.double?
  end

  def test_total_one_dice
    stub_randomizer.returns(3)
    assert_equal 3, @one_dice.roll!.total
  end

  def test_total_two_dice
    stub_randomizer.returns(3, 4)
    assert_equal 7, @two_dice.roll!.total
  end

  private

  def stub_randomizer
    Random.any_instance.stubs(:rand)
  end

end
