require_relative "../lib/board"
require_relative "../lib/player"
require "colorize"

# Contains all the methods to play the game
class Game
  attr_accessor :board

  def initialize(board = Board.new, turn = 1)
    @board = board
    @turn = turn
  end

  def start_game # rubocop:disable Metrics/MethodLength
    obtain_names
    @board.print_board

    # This repeats until someone wins or the board is full
    game_loop

    player = @turn.even? ? @player1 : @player2

    message = " Contratulations #{player.name.colorize(:green)} won "
    puts "#{message}horizontally!" if @board.horizontal_win?
    puts "#{message}vertically!" if @board.vertical_win?
    puts "#{message}diagonally!" if @board.diagonal_win?

    sleep 3

    another_game
    puts ""
  end

  # Gets the name of each of the player and gives them there symbols
  def obtain_names
    puts ""
    puts " Who will be playing?"
    puts ""
    print " Enter the first players name: "
    @player1 = Player.new(gets.chomp, "X")
    print " Enter the second players name: "
    @player2 = Player.new(gets.chomp, "O")
    puts ""
    puts " #{@player1.name} will have the symbol X "
    puts " #{@player2.name} will have the symbol O "
  end

  # This is basic loops that repeats until someone wins or board is full
  def game_loop # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    until @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win? || @board.full?
      @turn += 1
      player = @turn.even? ? @player1 : @player2
      move = nil

      until move == true # repeats until the move is valid, number between 1, 7
        print " #{player.name}, input a number between 1 and 7: "
        column = gets.chomp.to_i

        move = @board.valid_move?(column - 1)
        puts ""
        puts ""
      end

      @board.move(column - 1, player.symbol) # Decrements column by 1 as arrays use zero base indexing

      print "\e[13A\e[J"
      @board.print_board
    end
  end

  def another_game # rubocop:disable Metrics/MethodLength
    puts ""
    puts " Would you like to player another game?"
    puts ""
    print " Input y or n: "
    result = gets.chomp.downcase

    if result == "y"

      print "\e[23A\e[J"
      new_game = Game.new
      new_game.start_game
    else
      puts ""
      puts ""
      puts "  Thank you for playing connect four."
    end
  end
end
