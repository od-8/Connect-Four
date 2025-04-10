require_relative "../lib/board"

describe Board do
  subject(:test_board) { described_class.new }

  describe "#move" do
    context "when the first row is empty" do
      before do
        test_board.move(0, "X")
      end

      it "board should now have X at cords [0, 0]" do
        board = test_board.instance_variable_get(:@board)
        position = board[0][0]
        expect(position).to eq("X")
      end
    end

    context "when the first row is full so it goes to second row" do
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
    context "returns true as there is a win with X" do
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
    context "returns true as there is a win with O" do
      before do
        test_board.move(2, "O")
        test_board.move(3, "O")
        test_board.move(4, "O")
        test_board.move(5, "O")
      end

      it "returns true as there is a win on bottom row" do
        result = test_board.horizontal_win?
        expect(result).to eq(true)
      end
    end
  end

  describe "#diagonal_win?" do
    context "returns true as there is a downwards win with X" do
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

    context "returns true as there is a upwards win with O" do
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

      it "returns true as there is a win going up starting from [0, 3]" do
        result = test_board.diagonal_win?
        expect(result).to eq(true)
      end
    end
  end

  describe "#full?" do
    context "returns true when the board is full" do
      before do
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
  end
end
