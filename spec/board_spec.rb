# frozen_string_literal: false

describe Board do
  subject(:board) { described_class.new }
  let(:board_var) { board.instance_variable_get(:@board) }

  describe '#move' do
    column = 0
    row = 6

    expect
  end
end
