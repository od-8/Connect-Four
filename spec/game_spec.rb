# This file has all the tests for the game class
require_relative "../lib/game"

describe Game do
  winner_board = [
    [nil, nil, nil, "X", nil, nil, nil],
    [nil, nil, "X", nil, nil, nil, nil],
    [nil, "X", nil, nil, nil, nil, nil],
    ["X", nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil],
    [nil, nil, nil, nil, nil, nil, nil]
  ]

  subject(:test_game) { described_class.new(winner_board) }

  describe "#initialize" do
    # No test needed as it only creates instance variables
  end

  # I know this test is wrong but i don't know how to make it work
  describe "#obtain_names" do
    context "make sure it returns winning message" do
      before do
        allow(test_game.obtain_names).to receive(:gets).and_return("Bob", "Jim")
      end

      it "sets up two new instances of player class" do
        player1 = test_game.instance_variable_get(:@player1)
        player2 = test_game.instance_variable_get(:@player2)
        expect(player1.name).to eq("Bob")
        expect(player2.name).to eq("Jim")
      end
    end
  end
end
