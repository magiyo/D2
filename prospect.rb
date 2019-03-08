require_relative 'city.rb'
require_relative 'args.rb'

class Prospect
  attr_accessor :days, :loc, :totalruby, :totalfakes
  def initialize(seed)
    @days = 0
    @totalruby = 0
    @totalfakes =0
    @loc = initMap(seed)
  end

  def initMap(seed)
    prng = Random.new(seed.to_i)
    enumerablecanyon = City.new('Enumerable Canyon',1,1,prng)
    ducktypebeach = City.new('Duck Type Beach', 2, 2, prng)
    monkeypatchcity = City.new('Monkey Patch City', 1, 1, prng)
    niltown = City.new('Nil Town', 0,3,prng)
    matzburg = City.new('Matzburg', 3, 0, prng)
    hashcrossing = City.new('Hash Crossing', 2,2,prng)
    dynamicpalisades = City.new('Dynamic Palisades', 2,2, prng)


    enumerablecanyon.add_neighbors [ducktypebeach, monkeypatchcity]
    ducktypebeach.add_neighbors [enumerablecanyon, matzburg]
    monkeypatchcity.add_neighbors [niltown, enumerablecanyon, matzburg]
    niltown.add_neighbors [monkeypatchcity, hashcrossing]
    matzburg.add_neighbors [monkeypatchcity, dynamicpalisades, ducktypebeach,hashcrossing]
    hashcrossing.add_neighbors [matzburg, niltown, dynamicpalisades]
    dynamicpalisades.add_neighbors [matzburg, hashcrossing]
    enumerablecanyon
  end

  def move
    print "Heading from #{@loc.name} to ..."
    @loc = @loc.next
    puts " #{@loc.name}. "
  end

  def print_all_rubies(ruby, fakerubies)

    case 
    when ruby == 1 
      puts "Found #{ruby} ruby in #{@loc.name}. " 
    when ruby > 1
      puts "	Found #{ruby} rubies in #{@loc.name}. "
    when ruby < 1
      move
    end
    @totalruby += ruby 
    
    case
    when fakerubies == 1
      puts "Found #{fakerubies} ruby in #{@loc.name}. "
    when fakerubies > 1
      puts "	Found #{fakerubies} rubies in #{@loc.name}. "
    when fakerubies < 1
      move 
    end
    @totalfakes += fakerubies

    if ruby.zero? && fakerubies.zero? 
      move
    end
  end

  def simulate(num_of_prospector, num_of_turns)
    num_of_prospector.times do |x|
    n = x + 1
    puts "Rubyist #{n} starting in #{@loc.name}."
    current_turn = 0

    until current_turn == num_of_turns
      ruby = 1
      fakerubies = 1
      while ruby != 0 && fakerubies != 0 
        ruby = @loc.found_ruby
        fakerubies = @loc.found_fake
        @days += 1
        print_all_rubies(ruby, fakerubies)
        current_turn += 1
        if current_turn == num_of_turns
          break
        end
      end
    end

    puts "After #{@days} days, Rubyist ##{n} returned with:"
      if @totalruby == 1
        puts " #{@totalruby} ruby"
      else
        puts "#{@totalruby} rubies."
      end
    
      if @totalfakes == 1 
        puts "#{@totalfakes} fake ruby "
      else  
        puts "#{@totalfakes} fake rubies "
      end 

      if @totalruby >= 10
        puts "going home victorious!"
      elsif @totalruby >= 1 && @totalruby  <= 9
        puts 'going home sad :('
      elsif @totalruby == 0 
        puts 'going home empty-handed :,('
      end
    end
  end
end