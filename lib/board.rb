# This is the board itself
class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def print_board
    @board.reverse.each do |row|
      row.each do |position|
        if position.nil?
          print "|   "
        else
          print "| #{position} "
        end
      end
      print "|"
      puts ""
    end
    puts "|---|---|---|---|---|---|---|"
    puts "| 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    puts ""
  end

  def move(column, letter, index = 0)
    return "Invalid" if index > 6

    move(column, letter, index + 1) unless @board[index][column].nil?

    @board[index][column] = letter if @board[index][column].nil?
  end

  # Checks if either player has won vertically
  def vertical_win? # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    @board.each_with_index do |row, row_index|
      break if row_index > 2

      row.each_with_index do |_position, position_index|
        return true if @board[row_index][position_index] == "X" &&
                       @board[row_index + 1][position_index] == "X" &&
                       @board[row_index + 2][position_index] == "X" &&
                       @board[row_index + 3][position_index] == "X"

        return true if @board[row_index][position_index] == "O" &&
                       @board[row_index + 1][position_index] == "O" &&
                       @board[row_index + 2][position_index] == "O" &&
                       @board[row_index + 3][position_index] == "O"
      end
    end
    false
  end

  # Checks if either player has won horizontally
  def horizontal_win? # rubocop:disable Metrics/MethodLength
    x_counter = 0
    o_counter = 0

    @board.each do |row|
      row.each do |position|
        position == "X" ? x_counter += 1 : x_counter = 0
        position == "O" ? o_counter += 1 : o_counter = 0

        return true if x_counter >= 4
        return true if o_counter >= 4
      end
    end
    false
  end

  def diagonal_win? # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_positon, position_index|
        if row_index < 3
          return true if @board[row_index][position_index] == "X" &&
                         @board[row_index + 1][position_index + 1] == "X" &&
                         @board[row_index + 2][position_index + 2] == "X" &&
                         @board[row_index + 3][position_index + 3] == "X"

          return true if @board[row_index][position_index] == "O" &&
                         @board[row_index + 1][position_index + 1] == "O" &&
                         @board[row_index + 2][position_index + 2] == "O" &&
                         @board[row_index + 3][position_index + 3] == "O"
        end

        if row_index > 2 # rubocop:disable Style/Next
          return true if @board[row_index][position_index] == "X" &&
                         @board[row_index - 1][position_index + 1] == "X" &&
                         @board[row_index - 2][position_index + 2] == "X" &&
                         @board[row_index - 3][position_index + 3] == "X"

          return true if @board[row_index][position_index] == "O" &&
                         @board[row_index - 1][position_index + 1] == "O" &&
                         @board[row_index - 2][position_index + 2] == "O" &&
                         @board[row_index - 3][position_index + 3] == "O"
        end
      end
    end
    false
  end

  # Something wrong with this i beleive
  def full?
    @board.each do |row|
      row.each do |position|
        return false if position.nil?
      end
    end
    true
  end

  def valid_move?(column)
    return true if column.between?(0, 6)

    false
  end
end
