require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"

def print_name # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  puts ""
  puts ""
  puts ""
  puts '                     /-------|      /--------\      |------\         |---|   |------\         |---|  |----------|     /-------|  |---------------|' # rubocop:disable Layout/LineLength
  puts '                    /  /-----|     /  /----\  \     |       \        |   |   |       \        |   |  |   |------|    /  /-----|  |-----|   |-----|' # rubocop:disable Layout/LineLength
  puts '                   /  /           /  /      \  \    |   |\   \       |   |   |   |\   \       |   |  |   |          /  /               |   |' # rubocop:disable Layout/LineLength
  puts '                  |  |           |  |        |  |   |   | \   \      |   |   |   | \   \      |   |  |   |         |  |                |   |' # rubocop:disable Layout/LineLength
  puts '                  |  |           |  |        |  |   |   |  \   \     |   |   |   |  \   \     |   |  |   |         |  |                |   |' # rubocop:disable Layout/LineLength
  puts '                  |  |           |  |        |  |   |   |   \   \    |   |   |   |   \   \    |   |  |   |----|    |  |                |   |' # rubocop:disable Layout/LineLength
  puts '                  |  |           |  |        |  |   |   |    \   \   |   |   |   |    \   \   |   |  |   |         |  |                |   |' # rubocop:disable Layout/LineLength
  puts '                  |  |           |  |        |  |   |   |     \   \  |   |   |   |     \   \  |   |  |   |         |  |                |   |' # rubocop:disable Layout/LineLength
  puts '                   \  \           \  \      /  /    |   |      \   \ |   |   |   |      \   \ |   |  |   |          \  \               |   |' # rubocop:disable Layout/LineLength
  puts '                    \  \-----|     \  \----/  /     |   |       \   \|   |   |   |       \   \|   |  |   |------|    \  \-----|        |   |' # rubocop:disable Layout/LineLength
  puts '                     \-------|      \--------/      |---|        \-------|   |---|        \-------|  |----------|     \-------|        |---|' # rubocop:disable Layout/LineLength
  puts ""
  puts ""
  puts '                                                   |----------|     /--------\     |--|        |--|  |--------\ ' # rubocop:disable Layout/LineLength
  puts '                                                   |   |------|    /  /----\  \    |  |        |  |  |    /\   |' # rubocop:disable Layout/LineLength
  puts '                                                   |   |          /  /      \  \   |  |        |  |  |    \/   |' # rubocop:disable Layout/LineLength
  puts "                                                   |   |         |  |        |  |  |  |        |  |  |   |----/"
  puts '                                                   |   |---|     |  |        |  |  |  |        |  |  |      \ '
  puts '                                                   |   |---|     |  |        |  |  |  |        |  |  |   \   \ '
  puts '                                                   |   |         |  |        |  |  |  |        |  |  |   |\   \ ' # rubocop:disable Layout/LineLength
  puts '                                                   |   |         |  |        |  |  |  |        |  |  |   | \   \ ' # rubocop:disable Layout/LineLength
  puts '                                                   |   |          \  \      /  /   |   \      /   |  |   |  \   \ ' # rubocop:disable Layout/LineLength
  puts '                                                   |   |           \  \----/  /     \   \----/   /   |   |   \   \ ' # rubocop:disable Layout/LineLength
  puts '                                                   |---|            \--------/       \----------/    |---|    \---\ ' # rubocop:disable Layout/LineLength
  puts ""
  puts ""
  puts ""
end

print_name

puts " Who will be playing?".center(160)
puts ""
print "                                                                Enter the first players name: "
player1 = Player.new(gets.chomp, "X")
puts ""
print "                                                                Enter the second players name: "
player2 = Player.new(gets.chomp, "O")
puts ""
puts ""
puts "#{player1.name} will have the symbol X ".center(162)
puts "#{player2.name} will have the symbol O ".center(162)

test_game = Game.new(Board.new, player1, player2)
test_game.play_game

# Whats left that needs to be done
# 1 - Make it illegal if user adds disc to full column
# 2 - Make it so that the ansi escape codes work with incorrect input
# 3 - Fix and rework the winning methods that aren't written well
# 4 - Rework tests for board
# 5 - Add tests for game

# For the diagonal win it could look something like
# @board.each_with_index do |row, row_index|
#   row.each_with_index do |column, column_index|
#     if @board[row_index + 1][column_index + 1] == x
#.      x_counter += 1
#.    else 
#.      x_counter = 0
#.    end
#   end
# end

# This coulde handle x going up but would also need to do going down
# Wouls need to do for o aswell
