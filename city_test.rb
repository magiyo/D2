require 'minitest/autorun'
require_relative 'city.rb'

class CityTest < Minitest::Test
  # UNIT TESTS FOR METHOD initialize
  # Equivalence classes:
  # Valid city name
  # Valid number of max rubies
  # Valid number of fake rubies
  # Valid intialization of city

  def test_initialize
    test = Minitest::Mock.new
    city = City.new("Enumerable Canyon", 10, 3, test)
    assert_equal city.name, "Enumerable Canyon"
    assert city.maxruby, 0 
    assert city.maxfakes, 0
  end

  # UNIT TESTS FOR METHOD add_neighbors(cities)
  # Equivalence classes:
  # Valid Array
  # Non-valid Array

   # Test to see if  array is created and placed into city 
   def test_valid
    test = Minitest::Mock.new
    city = City.new("Matzburg", 6, 2, test)
    city2 = City.new("Duck Type Beach", 10, 5, test)
    city3 = City.new("Enumerable Canyon", 0, 1, test)
    Array cities = [city2, city3]
    city.add_neighbors cities
    assert_equal cities, city.cities
  end

  #test to see of array is passed into city array
  def test_valid_city
    test = Minitest::Mock.new
    city = City.new("Matzburg", 6, 2, test)
    city2 = City.new("Duck Type Beach", 10, 5, test)
    city3 = City.new("Enumerable Canyon", 0, 1, test)
    Array cities = [city2, city3]
    check = 0
    city.add_neighbors check
    assert_nil city.cities
  end

  # UNIT TESTS FOR METHOD next
  # Equivalence classes:
  # Neighbors
  # No neighbors
  
  # Test that a city has a positive number of neighbors
  def test_neighbors
    test = Minitest::Mock.new
    def test.prng(num); 1; end
    city = City.new("Enumerable Canyon", 1, 1, test)
    city2 = City.new("Duck Type Beach", 2, 3, test)
    city3 = City.new("Matzburg", 2, 3, test)
    city.add_neighbors [city2, city3]
    city = city.next
    assert_includes [city2, city3], city
  end

  # If a city has no neighbors, return nil
  def test_alone
    test = Minitest::Mock.new 
    city = City.new("Matzburg" , 3, 3, test )
    city = city.next
    assert_nil city 
  end

  # UNIT TESTS FOR METHOD found_ruby
  # Equivalence classes:
  # Max number of rubies

  # test to see if max rubies is valid in the given range 
  def test_correct_rubies
    test = Minitest::Mock.new
    city = City.new("Matzburgh", 1, 2, test)
    check = city.found_ruby
    assert_equal 1, l.maxruby
    assert_includes (0..3), check
  end

  # UNIT TESTS FOR METHOD found_fake
  # Equivalence classes:
  # Max number of fake rubies

  def test_correct_fakes
    test = Minitest::Mock.new
    city = City.new("Matzburgh", 1, 2, test)
    check = city.found_fake
    assert_includes (0..3), check
  end
end