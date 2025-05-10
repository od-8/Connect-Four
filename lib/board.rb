require "colorize"

# Contains the board and all of its methods like if someone's one or board if full
class Board # rubocop:disable Metrics/ClassLength
  def initialize(array)
    @board = array
  end

  # Method that print the board simply and easy to understand
  def print_board # rubocop:disable Metrics/MethodLength
    puts ""
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

  # Checks if the row is full so users move is invalid
  def full_row?(column)
    counter = 0

    @board.each_with_index do |_row, row_index|
      counter += 1 unless @board[row_index][column].nil?
    end

    counter == 6
  end

  # Repats untill if finds the first availbale space in a column
  def move(column, letter, index = 0)
    if @board[index][column].nil?
      @board[index][column] = letter
    else
      move(column, letter, index + 1)
    end
  end

  # Checks if either player has won vertically
  def vertical_win?
    @board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if %w[X O].include?(column)
          result = vertical_algorithim([row_index, column_index], column)
        end

        return true if result == true
      end
    end
    false
  end

  # Checks if there is a win in a column
  def vertical_algorithim(position, letter)
    counter = 0
    index = 0

    loop do
      break unless @board[position[0]][position[1]] == letter

      counter += 1  
      position = [position[0] + 1, position[1]]

      return true if counter == 4
    end
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
  def diagonal_win?
    @board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if %w[X O].include?(column)
          up_result = upwards_algorithm([row_index, column_index], column)
          down_result = downwards_algorithm([row_index, column_index], column)
        end

        return true if up_result == true || down_result == true
      end
    end
    false
  end

  # Checks if there is an upwards win
  def upwards_algorithm(position, letter)
    counter = 0

    loop do
      break if position[0] > 5 || position[1] > 6

      break unless @board[position[0]][position[1]] == letter

      counter += 1
      position = [position[0] + 1, position[1] + 1]

      return true if counter == 4
    end
  end

  # Checks if there is an downwards win
  def downwards_algorithm(position, letter)
    counter = 0

    loop do
      # break if position[0] < 0 || position[1] > 4

      break unless @board[position[0]][position[1]] == letter

      counter += 1
      position = [position[0] - 1, position[1] + 1]

      return true if counter == 4
    end
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
