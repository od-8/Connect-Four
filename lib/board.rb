# This is the board itself
class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def print_board
    # @board.reverse.each { |row| p row }
    @board.each { |row| p row }
  end

  def move(column, letter, index = 0)
    move(column, letter, index + 1) unless @board[index][column].nil?

    @board[index][column] = letter if @board[index][column].nil?
  end

  # Checks if either player has won vertically
  def vertical_win? # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    x_counter = Hash.new(0)
    o_counter = Hash.new(0)

    @board.each do |row|
      row.each_with_index do |position, position_index|
        x_counter[position_index] += 1 if position == "X"
        o_counter[position_index] += 1 if position == "O"

        return true if x_counter.values.any? { |n| n >= 4 }
        return true if o_counter.values.any? { |n| n >= 4 }
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

  def diagonal_win?
    # x_counter = 0
    # o_counter = 0
    @board.each_with_index do |row, _row_index|
      row.each_with_index do |positon, position_index|
        # difficile
      end
    end
  end
end
