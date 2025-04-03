require_relative "../lib/linked_list"

# Board itself
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { LinkedList.new }
    setup
  end

  # Setup up board when game is initialized
  def setup
    @board.each_with_index do |list, index|
      list.append(index)
    end
  end

  # Prints board so its easy to undrestand
  def print_board
    @board.each do |list|
      if list.size.positive?
        puts list.print_list
      else
        puts "nil"
      end
    end
  end

  # Adds letter to specific column
  def move(column, letter)
    @board[column].append(letter)
  end

  # Checks if number is between 0 - 6 as that is how many rows the baord has
  def valid_move?(column)
    return true if column.between?(0, 6)

    false
  end

  # Checks if player has won horizontally
  def horizontal_win?
    # loop through @board
    # loop through list
    # Check if node is equal to x and if so then check lists to right of it
    # Check is list has 3 to the righ of it
    # return boolean
  end

  # Check is player has won vertically
  def vertical_win? # rubocop:disable Metrics/MethodLength
    counter = 0

    @board.each do |list|
      list.my_each_with_index do |node, _index|
        if node.value == "x"
          counter += 1
          return true if counter >= 4 # Once it reaches 4 in a row loops stops and returns true
        else
          counter = 0
        end
      end
    end

    false
  end
end
