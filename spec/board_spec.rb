# frozen_string_literal: false

require_relative '../lib/board'
# require_relative '../lib/game'
# require_relative '../lib/player'
# require_relative '../lib/linked_list'
# require_relative '../lib/nodes'

describe Board do
  #let(:board_var) { board.instance_variable_get(:@board) }

  describe '#move' do
    subject(:board) { described_class.new }

    context 'when user takes a go' do
      before do 
        column = 0
        letter = 'x'
        board.move(column, letter)
      end

      it 'adds new peice and returns ' do
        board_var = board.instance_variable_get(:@board)
        column = 0
        row = 0
        node = board_var[column].at_index(row) 
        expect(node.value).to eq('x')
      end
    end
  end
end
