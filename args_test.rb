require 'minitest/autorun'
require_relative 'args.rb'

class ArgsTest < Minitest::Test
  # UNIT TESTS FOR METHOD check_args(args)
  # Equivalence classes:
  # args = -INFINITY.. -1 -> returns false
  # args = INFINITY.. 1 -> returns true
  # args = (not a number) -> returns false
  # args = 0 -> returns false


  # test if negative ints will fail 
  def test_negative
    args = Args.new
    assert_equal false, args.check_args(-2)
  end

  # test if positive ints will fail 
  def test_positive
    args = Args.new
    assert_equal false, args.check_args(6)
  end
  # test is missing args statement will fail 
  def test_empty
    args = Args.new
    assert_equal false, args.check_args(" ")
  end
  # test if 0 will fail 
  def test_zero
    args = Args.new
    assert_equal false, args.check_args(0)
  end

  #test if strings will fail 
  def test_negative
    args = Args.new
    assert_equal false, args.check_args("hello")
  end

end

