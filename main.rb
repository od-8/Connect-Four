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

def play_connect4 # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  print_name

  puts " Who will be playing?".center(160)
  puts ""
  print "                                                                Enter the first players name: "
  player1 = gets.chomp
  puts ""
  print "                                                                Enter the second players name: "
  player2 = gets.chomp

  until player1 != player2
    puts ""
    puts ""
    puts "Your names cannot be the same.".colorize(:red).center(175)
    puts ""
    print "                                                                Enter the first players name: "
    player1 = gets.chomp
    puts ""
    print "                                                                Enter the second players name: "
    player2 = gets.chomp
  end

  player1 = Player.new(player1, "X")
  player2 = Player.new(player2, "O")

  puts ""
  puts ""
  puts "#{player1.name} will have the symbol #{'X'.colorize(:red)}".center(175)
  puts "#{player2.name} will have the symbol #{'O'.colorize(:yellow)}".center(175)

  test_game = Game.new(player1, player2)
  test_game.play_game
end

play_connect4
