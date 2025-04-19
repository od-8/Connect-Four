require_relative "../lib/board"
require_relative "../lib/player"
require "colorize"

# Contains all the methods to play the game
class Game
  attr_accessor :board

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player2
  end

  # Game method itself, handles the loop and returns winner message, board full message and asks for another game
  def play_game # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    @board.print_board

    # This repeats until someone wins or the board is full
    until @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win? || @board.full?
      update_turn

      invalid_moves = 11

      valid_move = nil
      full_row = nil

      # Repeats untill user input is between 1-7 and that row isnt full
      until valid_move == true && full_row != true
        print " #{@current_player.name}, input a number between 1 and 7: "
        column = gets.chomp.to_i
        valid_move = @board.valid_move?(column - 1)
        full_row = @board.full_row?(column - 1)
        puts ""
        invalid_moves += 2
      end

      @board.move(column - 1, @current_player.symbol)
      puts ""
      print "\e[#{invalid_moves}A\e[J"
      @board.print_board
    end

    winner # Handles the message if someone wins
    full # Handles the messgae if the board is full

    sleep 3

    another_game # Asks if the player would like another game
    puts ""
  end

  # Updates current player, it sets current player to whoever it isnt right now
  def update_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Congratulates the player who won and says how they won
  def winner
    win_message = " Contratulations #{@current_player.name.colorize(:green)} won "
    puts "#{win_message}horizontally!" if @board.horizontal_win?
    puts "#{win_message}vertically!" if @board.vertical_win?
    puts "#{win_message}diagonally!" if @board.diagonal_win?
  end

  # Returns the message if the board is full and no one won
  def full
    puts "Unlucky players, the board is full so neither of you won." if @board.full?
  end

  # This asks for another game, it creates a new board but keeps the same players
  def another_game # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    puts ""
    puts " Would you like to player another game?"
    puts ""
    print " Input y or n: "
    result = gets.chomp.downcase

    if result == "y"
      print "\e[14A\e[J"
      new_game = Game.new(Board.new, @player1, @player2)
      new_game.play_game
    else
      puts ""
      puts ""
      puts ""
      puts "  Thank you for playing connect four.".colorize(:green).center(175)
      puts ""
      puts ""
      puts ""
    end
  end
end
