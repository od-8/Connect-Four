# frozen_string_literal: false

require_relative '../lib/linked_list'

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
      # list.append(index)
    end
  end

  # Prints board so its easy to undrestand
  def print_board
    @board.each do |list|
      if list.size > 0 
        puts list.print_list
      else
        puts 'nil'
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

  # Checks if either player has won horizontally
  def horizontal_win?
    # return true if a there is a row of 4 on any row

    # false
  end
end
