# frozen_string_literal: false

require_relative '../lib/linked_list'

# Board itself
class Board
  attr_accessor :lists

  def initialize
    @board = Array.new(7) { LinkedList.new }
    setup
  end

  def setup
    @board.each_with_index do |list, index|
      list.append(index) while list.size < 6
    end
  end

  def print_board
    @board.each_with_index do |list, _index|
      puts list.print_list
    end
  end

  # Functionality that handles a move
  def move; end
end
