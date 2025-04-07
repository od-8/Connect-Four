require_relative "unfinished_attempt/game"
require_relative "unfinished_attempt/board"
require_relative "unfinished_attempt/player"
require_relative "unfinished_attempt/linked_list"
require_relative "unfinished_attempt/nodes"

my_game = Game.new

my_game.board.move(1, "O")
my_game.board.move(2, "O")
my_game.board.move(3, "O")
my_game.board.move(4, "O")

p my_game.board.horizontal_win?
