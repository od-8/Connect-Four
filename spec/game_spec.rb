# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do # rubocop:disable Metrics/BlockLength
  let(:player1) { double("bob") }
  let(:player2) { double("jim") }

  before do
    allow(player1).to receive(:capitalize)
    allow(player2).to receive(:capitalize)
  end

  describe "#game_loop" do
    subject(:finished_game) { described_class.new(player1, player2) }
    context "when game_over? is false once" do
      before do
        allow(finished_game).to receive(:game_over?).and_return(false, true)
      end

      xit "calls update_turn once" do
        current_player = instance_variable_get(:@current_player)
        expect(finished_game).to receive(:update_turn).once
        expect(finished_game).to recieve(:player_turn).once
        expect(finished_game).to receive(:move).with()
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
      end

      it "stops loop and does not display error message" do
        error_message = "Input error, enter a valid column"
        expect(input_game).not_to receive(:puts).with(error_message)
        input_game.player_turn # - Not sure if i need this, tests still pass but idk
      end
    end

    context "when users input is invalid value, then a valid value" do
      before do
        invalid_input = "8"
        valid_input = "7"
        allow(input_game).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it "displays error message once then stops loop" do
        error_message = "Input error, enter a valid column"
        expect(input_game).to receive(:puts).with("").exactly(3).times
        expect(input_game).to receive(:puts).with(error_message).once
        input_game.player_turn
      end
    end

    context "when loop ends returns array" do
      before do
        valid_input = "6"
        allow(input_game).to receive(:gets).and_return(valid_input)
      end

      it "returns [column, invalid_moves]" do
        expect(input_game).to receive(:puts).with("").once
        return_arr = input_game.player_turn
        expect(return_arr).to eq([5, 13])
      end
    end
  end
end
