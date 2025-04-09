require "colorize"
# Contains all the methods to play the game
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @turn = 1
  end

  def start_game # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    # Starts of the game printing the board and getting the name of each of the players
    if @turn == 1
      details
      puts ""
      obtain_names
      puts ""
    end

    # This repeats until someone wins or the board is full
    game_loop

    player = @turn.even? ? @player1 : @player2

    message = " Contratulations #{player.name} won "
    puts "#{message}horizontally!" if @board.horizontal_win?
    puts "#{message}vertically!" if @board.vertical_win?
    puts "#{message}diagonally!" if @board.diagonal_win?

    sleep 5

    another_game
    puts ""
  end

  # Gets the name of each of the player and gives them there symbols
  def obtain_names
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

  # Basic display to help user understand how to play the game
  def details
    puts ""
    puts " This game has the basic rules of connect four."
    puts ""
    sleep 2
    puts " The board you will be playing on looks like this: "
    sleep 1.5
    puts ""
    @board.print_board
    sleep 1.5
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

      @board.print_board
    end
  end

  def another_game
    puts ""
    puts " Would you like to player another game?"
    puts ""
    print " Input y or n: "
    result = gets.chomp.downcase

    return unless result == "y"

    new_game = Game.new
    new_game.start_game
  end
end
