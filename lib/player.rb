# Class that has player info and methods
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name.capitalize # Players name
    @symbol = symbol # Symbol of the player, "X" or "O"
  end
end
