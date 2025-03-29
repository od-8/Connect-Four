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
      list.append(index.to_s) while list.size < 7
    end
  end

  def print_board
    # p @board

    @board.each_with_index do |_list, index|
      @board.each_with_index do |sub_list, _sub_index|
        print "| #{sub_list.at_index(index + 1)} "
      end
      print '|'
      puts ''
    end
    puts ''
  end

  # Functionality that handles a move
  def move; end
end
