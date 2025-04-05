require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/linked_list"
require_relative "lib/nodes"

my_game = Game.new

my_game.board.move(1, "O")
my_game.board.move(2, "O")
my_game.board.move(3, "O")
my_game.board.move(4, "O")

p my_game.board.horizontal_win?
