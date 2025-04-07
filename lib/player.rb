# Class that has player info and methods
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name.capitalize # String
    @symbol = symbol # String
  end
end
