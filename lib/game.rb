# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/player'

# Contains methods that run the game itself
class Game
  # Will set up the board and basic functionality
  def initialize
    @board = Board.new
  end

  def start
    print 'Enter the first players name: '
    @player1 = Player.new(gets.chomp)
    print 'Enter the second players name: '
    @player2 = Player.new(gets.chomp)
  end

  # Handles if someone has won or board is full
  def game_over; end

  def info
    @board.print_board
  end

  def go
    @board.move(0, 'x')
  end
end

# print "\e[2K\e[G"
# print "\e[1A\e[2K"
