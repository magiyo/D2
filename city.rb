# class for the Cities for the map

class City
  attr_reader :name, :cities, :maxruby, :maxfakes, :prng
  def initialize(name, maxruby, maxfakes, prng)
    @name = name
    @cities = nil
    @maxruby = maxruby
    @maxfakes = maxfakes
    @prng = prng
  end

  def add_neighbors(cities)
    return nil unless cities.is_a? Array

    @cities = cities
  end

  def next
    return nil if @cities.nil?

    nc = @prng.rand(0...@cities.length)
    @cities[nc]
  end

  def found_ruby
    @prng.rand(0..@maxruby)
  end

  def found_fake
    @prng.rand(0..@maxfakes)
  end

end