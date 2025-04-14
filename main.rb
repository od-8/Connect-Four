require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

test_game = Game.new
test_game.start_game

# Whats left that needs to be done
# 1 - Make it illegal if user adds disc to full column
# 2 - Make it so that the ansi escape codes work with incorrect input
# 3 - Fix and rework the winning methods that aren't written well
# 4 - Rework tests for board
# 5 - Add tests for game
