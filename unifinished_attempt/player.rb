# Class that handles players
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name # String
    @symbol = symbol # String
  end
end
