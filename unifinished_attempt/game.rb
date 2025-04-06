require_relative "../lib/board"
require_relative "../lib/player"

# Contains the methods that run the game itself
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  # Get names of players
  def obtain_names
    print "Enter the first players name: "
    @player1 = Player.new(gets.chomp, "X")
    print "Enter the second players name: "
    @player2 = Player.new(gets.chomp, "O")
  end

  # Handles if someone has won or board is full
  def game_over; end
end

# print "\e[2K\e[G"
# print "\e[1A\e[2K"
