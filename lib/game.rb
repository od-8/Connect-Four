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

  def play_game
    @board.print_board

    # This repeats until someone wins or the board is full
    game_loop

    message = " Contratulations #{@current_player.name.colorize(:green)} won "
    puts "#{message}horizontally!" if @board.horizontal_win?
    puts "#{message}vertically!" if @board.vertical_win?
    puts "#{message}diagonally!" if @board.diagonal_win?

    sleep 3

    another_game
    puts ""
  end

  # Updates current player, it sets current player to whoever it isnt right now
  def update_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # This is the loop that handles the functionality, it repeats until there is a winner or the board is full
  def game_loop # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    until @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win? || @board.full?
      update_turn

      move = nil

      until move == true # repeats until the move is valid, inputs is a number between 1, 7
        print " #{@current_player.name}, input a number between 1 and 7: "
        column = gets.chomp.to_i

        move = @board.valid_move?(column - 1)
        puts ""
        puts ""
      end

      @board.move(column - 1, @current_player.symbol) # Decrements column by 1 as arrays use zero base indexing

      print "\e[13A\e[J"
      @board.print_board
    end
  end

  # This asks for another game, it creates a new board but keeps the same players
  def another_game # rubocop:disable Metrics/MethodLength
    puts ""
    puts " Would you like to player another game?"
    puts ""
    print " Input y or n: "
    result = gets.chomp.downcase

    if result == "y"
      print "\e[23A\e[J"
      new_game = Game.new(Board.new, @player1, @player2)
      new_game.play_game
    else
      puts ""
      puts ""
      puts "  Thank you for playing connect four."
    end
  end
end
