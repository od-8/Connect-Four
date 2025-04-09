require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

# test_game = Game.new

# test_game.start_game

i = 0
9.times do
  puts " | #{i += 1} |"
end

# print "\033[10A"
# print "\e[2K\e[G"
print "\e[3A\e[2K"
