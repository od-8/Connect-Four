# frozen_string_literal: false

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/linked_list'
require_relative 'lib/nodes'

my_game = Game.new
my_game.board.print_board

puts ''

my_game.board.move(1, 'x')
my_game.board.move(1, 'x')
my_game.board.move(1, 'x')
my_game.board.move(1, 'x')
# my_game.board.move(6, 'x')

puts ''

my_game.board.print_board

puts ''

# p my_game.board.horizontal_win?

my_game.board.vertical_win?
