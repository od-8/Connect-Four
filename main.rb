require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

test_game = Game.new

# test_game.board.move(0, "X")
# test_game.board.move(1, "O")
# test_game.board.move(1, "X")
# test_game.board.move(2, "O")
# test_game.board.move(2, "O")
# test_game.board.move(2, "X")
# test_game.board.move(3, "O")
# test_game.board.move(3, "O")
# test_game.board.move(3, "O")
# test_game.board.move(3, "X")

test_game.start_game
