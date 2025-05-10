# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do # rubocop:disable Metrics/BlockLength
  let(:test_board) { double(Board) }
  subject(:test_game) do
    game = Game.new("player1", "player2")
    game.instance_variable_set(:@board, test_board)
    game
  end

  describe "#game_loop" do # rubocop:disable Metrics/BlockLength
    context "when game_over? is false once" do
      before do
        allow(test_game).to receive(:game_over?).and_return(false, true)
        allow(test_game).to receive(:player_turn).and_return([5, 13])
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:print)
        allow(test_board).to receive(:move)
        allow(test_board).to receive(:print_board)
      end

      it "calls update_turn once" do
        expect(test_game).to receive(:update_turn).once
        test_game.game_loop
      end
    end

    context "when game_over? is false three times" do
      before do
        allow(test_game).to receive(:game_over?).and_return(false, false, false, true)
        allow(test_game).to receive(:player_turn).and_return([5, 13])
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:print)
        allow(test_board).to receive(:move)
        allow(test_board).to receive(:print_board)
      end

      it "calls update_turn three times" do
        expect(test_game).to receive(:update_turn).exactly(3).times
        test_game.game_loop
      end
    end

    context "when column is 5 sends call to board.#move" do
      before do
        allow(test_game).to receive(:game_over?).and_return(false, true)
        allow(test_game).to receive(:player_turn).and_return([5, 13])
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:print)
        allow(test_board).to receive(:print_board)
      end

      it "expect board to receive #move with 5" do
        expect(test_board).to receive(:move).with(5, "X").once
        test_game.game_loop
      end
    end

    context "calls board.print_board" do
      before do
        allow(test_game).to receive(:game_over?).and_return(false, true)
        allow(test_game).to receive(:player_turn).and_return([5, 13])
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:print)
        allow(test_board).to receive(:move)
      end

      it "calls baord.print_board once" do
        expect(test_board).to receive(:print_board).once
        test_game.game_loop
      end
    end
  end

  describe "#player_turn" do # rubocop:disable Metrics/BlockLength
    context "when users input is a valid value" do
      before do
        valid_input = "5"
        allow(test_game).to receive(:gets).and_return(valid_input)
        allow(test_game).to receive(:valid_move?).and_return(true)
        allow(test_game).to receive(:full_row?).and_return(false)
        allow(test_game).to receive(:print)
      end

      it "stops loop and does not display error message" do
        error_message = " Input error, enter a valid column"
        expect(test_game).not_to receive(:puts).with(error_message)
        test_game.player_turn
      end
    end

    context "when users input is invalid value, then a valid value" do
      before do
        invalid_input = "8"
        valid_input = "3"
        allow(test_game).to receive(:gets).and_return(invalid_input, valid_input)
        allow(test_game).to receive(:valid_move?).and_return(false, true)
        allow(test_game).to receive(:full_row?).and_return(false, false)
        allow(test_game).to receive(:puts).with("")
        allow(test_game).to receive(:print)
      end

      it "displays error message once then stops loop" do
        error_message = " Input error, enter a valid column"
        expect(test_game).to receive(:puts).with(error_message).once
        test_game.player_turn
      end
    end

    context "when loop ends returns array" do
      before do
        valid_input = "6"
        allow(test_game).to receive(:gets).and_return(valid_input)
        allow(test_game).to receive(:valid_move?).and_return(true)
        allow(test_game).to receive(:full_row?).and_return(false)
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:print)
      end

      it "returns [column - 1, invalid_moves]" do
        result_arr = test_game.player_turn
        expect(result_arr).to eq([5, 13])
      end
    end
  end
end
