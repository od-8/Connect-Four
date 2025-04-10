require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

test_game = Game.new

# test_game.board.print_board
test_game.start_game

# print "\033[2A"
# print "\e[2K"
# print "\e[3A\e[2K"
