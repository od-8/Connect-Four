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
    @board[column].append(letter.capitalize)
  end

  # Checks if number is between 0 - 6 as that is how many rows the board has
  def valid_move?(column)
    return true if column.between?(0, 6)

    false
  end

  # Checks if player has won horizontally
  def horizontal_win?
    @board.each_with_index do |list, list_index|
      list.my_each_with_index do |_node, node_index|
        return true if @board[list_index].at_index(node_index).value == "X" &&
                       @board[list_index + 1].at_index(node_index).value == "X" &&
                       @board[list_index + 2].at_index(node_index).value == "X" &&
                       @board[list_index + 3].at_index(node_index).value == "X"

        return true if @board[list_index].at_index(node_index).value == "O" &&
                       @board[list_index + 1].at_index(node_index).value == "O" &&
                       @board[list_index + 2].at_index(node_index).value == "O" &&
                       @board[list_index + 3].at_index(node_index).value == "O"
      end
    end
    false
  end

  # Check is player has won vertically
  def vertical_win?
    x_counter = Hash.new(0)
    o_counter = Hash.new(0)

    @board.each_with_index do |list, list_index|
      list.my_each_with_index do |node, _node_index|
        x_counter[list_index] += 1 if node.value == "X"
        o_counter[list_index] += 1 if node.value == "O"

        return true if x_counter.values.any? { |n| n >= 4 }
        return true if o_counter.values.any? { |n| n >= 4 }
      end
    end
    false
  end
end
