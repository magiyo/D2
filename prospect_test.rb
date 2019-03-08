require 'minitest/autorun'
require_relative 'prospect.rb'
require_relative 'city.rb'

class SimulatorTest < Minitest::Test
  # UNIT TESTS FOR METHOD initialize(seed)
  # Equivalence classes:
  # Valid number of days
  # Valid number of locations
  # Valid number of total rubies
  # Valid number of total fake rubies

  # Test default vars = 0 
  def test_default
    test = Prospect.new(0)
    assert_equal test.days, 0
    assert_equal test.totalruby, 0
    assert_equal test.totalfakes, 0
  end

  # UNIT TESTS FOR METHOD initMap(seed)
  # Equivalence classes:
  # Map names

  def test_valid_maps
    test = Prospect.new(0)
    assert_equal test.loc.name, 'Matzburg'
  end

  def test_valid_maps2
    test = Prospect.new(0)
    assert_equal test.loc.name, 'Enumerable Canyon'
  end

  # UNIT TESTS FOR METHOD print_all_rubies(ruby, fakes)
  # Equivalence classes:
  # Number of rubies > 1 || = 0
  # Number of fake rubies > 1 || = 0
  # Number of rubies = 1
  # Number of fakes rubies = 1

  # Test that the correct form of 'ruby' is used for fake rubies
  def test_print_fake
    test = Prospect.new(0)
    test.totalfakes = 1
    assert_output(/\tFound 1 fake ruby in Enumerable Canyon. /) { test.print_all_rubies(test.totalruby, test.totalfakes)}
  end

end