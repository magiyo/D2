
require_relative 'city.rb'
require_relative 'prospect.rb'
require_relative 'args.rb'

def show_usageDisplay
    puts 'help:'
    puts 'ruby ruby_rush.rb *seed* *num of Prospecters* *num of turns*'
    puts '*seed, num of Prospectors, num of turns* should be a non negative integer'
    exit 1
end

args = Args.new
valid_args = args.check_args ARGV

if valid_args
    seed = ARGV[0].to_i
    num_of_prospectors = ARGV[1].to_i
    num_turns = ARGV[2].to_i
    run = Prospect.new ARGV[0]
    run.simulate(seed, num_turns)
  else
    show_usageDisplay
  end
