require_relative "../lib/board"
require_relative "../lib/player"
require "colorize"

# Contains all the methods to play the game
class Game
  attr_accessor :board

  def initialize(player1, player2, board = Array.new(6) { Array.new(7) })
    @board = Board.new(board)
    @player1 = Player.new(player1, "X")
    @player2 = Player.new(player2, "O")
    @current_player = @player2
  end

  # Game method itself, handles the loops, if theres a winner, board if full and asks for another game
  def play_game
    @board.print_board

    game_loop
    winner
    full_board

    sleep 3

    another_game
    puts ""
  end

  # Repeats untill someone wins or board is full
  def game_loop
    until game_over?
      update_turn

      column, invalid_moves = player_turn

      @board.move(column, @current_player.symbol)
      puts ""
      print "\e[#{invalid_moves}A\e[J"
      @board.print_board
    end
  end

  # Repeats until players move is valid
  def player_turn # rubocop:disable Metrics/MethodLength
    invalid_moves = 9
    column = 10

    loop do
      print " #{@current_player.name}, input a number between 1 and 7: "
      column = gets.chomp.to_i - 1
      invalid_moves += 4
      puts ""
      break if valid_move?(column) && !full_row?(column)

      puts " Input error, enter a valid column"
      puts ""
    end

    [column, invalid_moves]
  end

  # Checks if someone wins or board if full
  def game_over?
    @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win? || @board.full?
  end

  # Checks if move is valid
  def valid_move?(column)
    @board.valid_move?(column)
  end

  # Checks if the row is full
  def full_row?(column)
    @board.full_row?(column)
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
  def full_board
    puts "Unlucky players, the board is full so neither of you won." if @board.full?
  end

  # This asks for another game, it creates a new board but keeps the same players
  def another_game # rubocop:disable Metrics/MethodLength
    puts ""
    puts " Would you like to player another game?"
    puts ""
    print " Input y or n: "
    result = gets.chomp.downcase

    if result == "y"
      print "\e[15A\e[J"
      new_game = Game.new(@player1.name, @player2.name)
      new_game.play_game
    else
      puts ""
      puts ""
      puts " Thank you for playing Connect Four.".colorize(:green)
    end
  end
end
