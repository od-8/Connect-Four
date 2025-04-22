# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do
  describe "#game_loop" do
    # tests to be
  end

  describe "#player_turn" do
    let(:new_board) { double("board") }
    let(:player1) { double("player") }
    let(:player2) { double("player") }
    subject(:test_game) { described_class.new(new_board, player1, player2) }

    context "returns column and invalid_moves" do
      # Write a test that stops when valid_move?(column) and !full_row?(column)
      # returns true and not true, when column is 1 receive message once
      it "ret"
    end
  end
end
