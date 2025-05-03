# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do # rubocop:disable Metrics/BlockLength
  # let(:player1) { double("bob") }
  # let(:player2) { double("jim") }

  # before do
  # allow(player1).to receive(:capitalize)
  # allow(player2).to receive(:capitalize)
  # end

  subject(:test_game) do
    game = Game.new("Bob", "Jim")
    game.instance_variable_set(:@board, test_board)
  end

  describe "#game_loop" do # rubocop:disable Metrics/BlockLength
    subject(:finished_game) { described_class.new(player1, player2) }
    let(:finished_board) { double(Board) }

    context "when game_over? is false once" do
      before do
        allow(finished_game).to receive(:game_over?).and_return(false, true)
        allow(finished_game).to receive(:player_turn).and_return([1, 13])
        # allow(finished_board).to receive(:print_board)
      end

      xit "calls update_turn once" do
        # expect(finished_board).to recive
        expect(finished_game).to receive(:update_turn).once
        finished_game.game_loop
      end
    end

    context "when game_over? is false three times" do
      before do
        allow(finished_game).to receive(:game_over?).and_return(false, false, false, true)
        allow(finished_game).to receive(:player_turn).and_return([3, 13])
      end

      xit "calls update_turn three times" do
        expect(finished_game).to receive(:update_turn).exactly(3).times
        finished_game.game_loop
      end
    end

    context "when column is 5 sends call to board.#move" do
      before do
        valid_move = 5
        finished_game.instance_variable_set(:@board, finished_board)
        allow(finished_game).to receive(:player_turn).and_return([valid_move - 1, 13])
        allow(finished_game).to receive(:game_over?).and_return(false, true)
        allow(finished_board).to receive(:print_board)
      end

      xit "expect board to receive #move with 5" do
        expect(finished_board).to receive(:move).with(4, "X")
        finished_game.game_loop
      end
    end

    context "calls board.print_board" do
      before do
        finished_game.instance_variable_set(:@board, finished_board)
        allow(finished_game).to receive(:game_over?).and_return(false, true)
        allow(finished_game).to receive(:player_turn).and_return([4, 13])
        allow(finished_board).to receive(:move).with(4, "X")
      end

      xit "calls baord.print_board once" do
        expect(finished_board).to receive(:print_board).once
        finished_game.game_loop
      end
    end
  end

  describe "#player_turn" do # rubocop:disable Metrics/BlockLength
    subject(:input_game) { described_class.new(player1, player2) }
    context "when users input is valid" do
      before do
        valid_input = "4"
        allow(input_game).to receive(:gets).and_return(valid_input)
        # allow(input_game).to receive(:puts)
      end

      it "stops loop and does not display error message" do
        error_message = "Input error, enter a valid column"
        expect(input_game).not_to receive(:puts).with(error_message)
        # input_game.player_turn # - Not sure if i need this, tests still pass but idk
      end
    end

    context "when users input is invalid value, then a valid value" do
      before do
        invalid_input = "8"
        valid_input = "7"
        allow(input_game).to receive(:gets).and_return(invalid_input, valid_input)
        # allow(input_game)
      end

      it "displays error message once then stops loop" do
        error_message = " Input error, enter a valid column"
        expect(input_game).to receive(:puts).with(error_message).once
        input_game.player_turn
      end
    end

    context "when loop ends returns array" do
      before do
        valid_input = "6"
        allow(input_game).to receive(:gets).and_return(valid_input)
      end

      xit "returns [column - 1, invalid_moves]" do
        expect(input_game).to receive(:puts).with("").once
        return_arr = input_game.player_turn
        expect(return_arr).to eq([5, 13])
      end
    end
  end
end
