require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require "colorize"
def print_name
  puts "   _____                            _     _  _   "
  puts "  / ____|                          | |   | || |  "
  puts " | |     ___  ____  ____   ___  ___| |_  | || |_ "
  puts ' | |    / _ \| __ \| __ \ / _ \/ __| __| |__   _|'
  puts " | |___| (_) | | | | | | |  __/ (__| |_     | |  "
  puts '  \_____\___/|_| |_|_| |_|\___|\___|\__|    |_|  '
  puts ""
end

def play_connect4 # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  print_name

  puts " Who will be playing?"
  puts ""
  print "Enter the first players name: "
  player1 = gets.chomp
  print "Enter the second players name: "
  player2 = gets.chomp

  until player1 != player2
    puts ""
    puts ""
    puts "Your names cannot be the same.".colorize(:red)
    puts ""
    print "Enter the first players name: "
    player1 = gets.chomp
    puts ""
    print "Enter the second players name: "
    player2 = gets.chomp
  end

  puts ""
  puts ""
  puts "#{player1} will have the symbol #{'X'.colorize(:red)}"
  puts "#{player2} will have the symbol #{'O'.colorize(:yellow)}"

  test_game = Game.new(player1, player2)
  test_game.play_game
end

play_connect4
