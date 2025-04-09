require "colorize"

# Contains the board and all of its methods like if someone's one or board if full
class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  # Method that print the board simply and easy to understand
  def print_board # rubocop:disable Metrics/MethodLength
    @board.reverse.each do |row| # reverse the board as its upside down if you dont reverse it
      row.each do |position|
        if position.nil?
          print "|   "
        elsif position == "X"
          print "| #{position.colorize(:red)} "
        elsif position == "O"
          print "| #{position.colorize(:yellow)} "
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
    return index if index == 6 # Handles if the column is full

    # Checks if row 0 is empty as that bottom of board
    if @board[index][column].nil?
      @board[index][column] = letter # If column 0 is nil then it sets it equal to the letter
    else
      # The index + 1 increments the row, so every time index increments it moves up 1 row
      move(column, letter, index + 1) # If row 0 is not nil then it calls itself until it is nil
    end
  end

  # Checks if either player has won vertically
  def vertical_win? # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    @board.each_with_index do |row, row_index|
      break if row_index > 2 # Stops when board is greater than half way as its impossible to have a win

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

  # Checks if either player has won diagonally
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

  # Check each position and if any of them are nil then board is not full
  def full?
    @board.each do |row|
      row.each do |position|
        return false if position.nil?
      end
    end
    true
  end

  # Makes sure user input is between 0, 6 as any greater would be out of bounds
  def valid_move?(column)
    return true if column.between?(0, 6)

    false
  end
end
