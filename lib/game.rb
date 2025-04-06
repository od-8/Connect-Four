# The actual game with methods for playing it
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end
end
