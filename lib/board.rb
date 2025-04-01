# frozen_string_literal: false

require_relative '../lib/linked_list'

# Board itself
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { LinkedList.new }
    setup
  end

  def setup
    @board.each_with_index do |list, index|
      list.append(index) #while list.size < 6
    end
    # p @board
  end

  def print_board
    # @board.each_with_index do |list, index|
    #   puts list.print_list
    # end
    p @board[0].at_index(1).value
  end

  # Functionality that handles a move
  def move(column, letter)
    # set the number at the bottom left of the board to the string 'x'
    @board[column].append('x')
  end
end
