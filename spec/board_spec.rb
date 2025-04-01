# frozen_string_literal: false

require_relative '../lib/board'
# require_relative '../lib/game'
# require_relative '../lib/player'
# require_relative '../lib/linked_list'
# require_relative '../lib/nodes'

describe Board do # rubocop:disable Metrics/BlockLength
  subject(:test_board) { described_class.new }

  describe '#move' do
    context 'when user takes a go' do
      before do
        column = 0
        letter = 'x'
        test_board.move(column, letter)
      end

      it 'adds new peice to board' do
        board = test_board.instance_variable_get(:@board)
        column = 0
        row = 0
        node = board[column].at_index(row)
        expect(node.value).to eq('x')
      end
    end
  end

  describe '#valid_move?' do
    context 'when user inputs a valid move' do
      it 'returns true as 6 is valid (between range 0 - 6)' do
        column = 6 # Valid column
        result = test_board.valid_move?(column)
        expect(result).to be(true)
      end
    end

    context 'when user inputs an invalid move' do
      it 'returns false as 7 is invalid (between range 0 - 6)' do
        column = 7 # Invalid column
        result = test_board.valid_move?(column)
        expect(result).to be(false)
      end
    end
  end

  describe '#horizontal_win?' do
    context 'returns true when the player has won horizontally' do
      before do
        test_board.move(1, 'x')
        test_board.move(2, 'x')
        test_board.move(3, 'x')
        test_board.move(4, 'x')
        test_board.print_board
      end

      it 'returns true as row of 4 on bottom row of board' do
        result = test_board.horizontal_win?
        expect(result).to be(true)
      end
    end
  end
end
