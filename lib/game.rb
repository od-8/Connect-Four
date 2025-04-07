# The actual game with methods for playing it
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    @turn = 0
  end

  def start_game # rubocop:disable Metrics/MethodLength
    if @turn.zero?
      details
      puts ""
      obtain_names
      puts ""
    end

    game_loop

    message = "Contrats someone won "
    " #{message}horizontally." if @board.horizontal_win? # rubocop:disable Lint/Void
    " #{message}vertically." if @board.vertical_win? # rubocop:disable Lint/Void
    " #{message}diagonally." if @board.diagonal_win?
  end

  def obtain_names
    puts " Enter your names"
    puts ""
    print " Enter the first players name: "
    @player1 = Player.new(gets.chomp, "X")
    print " Enter the second players name: "
    @player2 = Player.new(gets.chomp, "O")
    puts ""
    puts " #{@player1.name} will have the symbol 'X' "
    puts " #{@player2.name} will have the symbol 'O' "
  end

  def details # rubocop:disable Metrics/MethodLength
    puts ""
    puts " Each player gets a go and you will keep on playing untill someone wins or the board if full"
    puts ""
    sleep 2
    puts " You must input a number between 1 and 7 inclusive"
    puts ""
    sleep 2
    puts " Which ever number you choose will be the column which your symbol wil be added to"
    puts ""
    sleep 2
    puts " The board looks like this"
    sleep 2
    puts ""
    @board.print_board
  end

  def game_loop # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity
    until @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win? || @board.full?
      player = @turn.even? ? @player1 : @player2
      move = nil

      until move == true
        print "#{player.name}, input a number between 1 and 7: "
        column = gets.chomp.to_i

        move = @board.valid_move?(column - 1)
        puts ""
        puts ""
      end

      go = @board.move(column - 1, player.symbol)

      if go == "Invalid"
        puts "INVALID move"
        next
      end

      @board.print_board
      @turn += 1
    end
  end
end
