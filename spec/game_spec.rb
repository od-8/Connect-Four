# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do
  let(:player1) { instance_double(Player, name: "Bob", symbol: "X") }
  let(:player2) { instance_double(Player, name: "Jim", symbol: "O") }
  subject(:game) { described_class.new(player1, player2) }

  describe "#game_loop" do
    # something
  end

  describe "#player_turn" do
    context "when input is valid it prints message once" do
      it "prints message once as the input is valid" do
        message = " Jim, input a number between 1 and 7: "
        expect(game).to receive(:print).with()
      end
    end

    context "when user input is invlaid and column isnt full" do
      # to do
    end
  end
end
