# This file has all the tests for the board class
require_relative "../lib/board"

# Methods that need testing
# full_row?

describe Board do # rubocop:disable Metrics/BlockLength
  subject(:test_board) { described_class.new }

  describe "#move" do
    context "adds symbol to first row of first column as its empty" do
      before do
        test_board.move(0, "X")
      end

      it "board now has x at [0,0]" do
        board = test_board.instance_variable_get(:@board)
        position = board[0][0]
        expect(position).to eq("X")
      end
    end

    context "adds symbol to second row of first column as first row is full of first column is full" do
      before do
        test_board.move(0, "X")
        test_board.move(0, "O")
      end

      it "board should now have O at cords [1, 0]" do
        board = test_board.instance_variable_get(:@board)
        position = board[1][0]
        expect(position).to eq("O")
      end
    end
  end

  describe "#vertical_win?" do
    context "returns true when someone wins vertically" do
      before do
        test_board.move(2, "X")
        test_board.move(2, "X")
        test_board.move(2, "X")
        test_board.move(2, "X")
      end

      it "returns true as there is a win in the third column" do
        result = test_board.vertical_win?
        expect(result).to eq(true)
      end
    end
  end

  describe "#horizontal_win?" do
    context "returns true when someone wins horizontally" do
      before do
        test_board.move(2, "O")
        test_board.move(3, "O")
        test_board.move(4, "O")
        test_board.move(5, "O")
      end

      it "returns true as there is a win on the first row" do
        result = test_board.horizontal_win?
        expect(result).to eq(true)
      end
    end
  end

  describe "#diagonal_win?" do # rubocop:disable Metrics/BlockLength
    context "returns true when someone wins diagonally down" do
      before do
        test_board.move(0, "X")
        test_board.move(1, "O")
        test_board.move(1, "X")
        test_board.move(2, "O")
        test_board.move(2, "O")
        test_board.move(2, "X")
        test_board.move(3, "O")
        test_board.move(3, "O")
        test_board.move(3, "O")
        test_board.move(3, "X")
      end

      it "returns true as there is a win going down starting from [0, 0]" do
        result = test_board.diagonal_win?
        expect(result).to eq(true)
      end
    end

    context "returns true when someone wins diagonally up" do
      before do
        test_board.move(0, "X")
        test_board.move(0, "X")
        test_board.move(0, "X")
        test_board.move(0, "O")
        test_board.move(1, "X")
        test_board.move(1, "X")
        test_board.move(1, "O")
        test_board.move(2, "X")
        test_board.move(2, "O")
        test_board.move(3, "O")
      end

      it "returns true as there is a win going up starting from [3, 0]" do
        result = test_board.diagonal_win?
        expect(result).to eq(true)
      end
    end
  end

  describe "#full?" do # rubocop:disable Metrics/BlockLength
    context "returns true when the board is full" do # rubocop:disable Metrics/BlockLength
      before do # rubocop:disable Metrics/BlockLength
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
        test_board.move(0, "X")
        test_board.move(1, "X")
        test_board.move(2, "X")
        test_board.move(3, "X")
        test_board.move(4, "X")
        test_board.move(5, "X")
        test_board.move(6, "X")
      end

      it "returns true as the board is full" do
        result = test_board.full?
        expect(result).to eq(true)
      end
    end
  end

  describe "#valid_move?" do
    context "returns true if the move is valid" do
      it "returns true as move is valid" do
        result = test_board.valid_move?(5)
        expect(result).to eq(true)
      end
    end

    context "returns false if the move is invalid" do
      it "returns false as column doesnt exist" do
        result = test_board.valid_move?(10)
        expect(result).to eq(false)
      end
    end
  end

  describe "#full_row?" do
    context "returns true if the row is full" do
      before do
        test_board.move(1, "X")
        test_board.move(1, "X")
        test_board.move(1, "X")
        test_board.move(1, "X")
        test_board.move(1, "X")
        test_board.move(1, "X")
      end

      it "returns true as row is full" do
        result = test_board.full_row?(1)
        expect(result).to eq(true)
      end
    end
  end
end
