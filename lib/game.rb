class Game
  def initialize; end # Will set up the board and basic functionality

  def move; end # Functionality that handles a move

  def vertical_win?; end # Checks if there is a vertical win

  def horizontal_win?; end # Checks if there is a horizontal win
  
  def diagonal_win?; end # Checks if there is a diagonal win

  def full?; end # Checks if board is full

  def game_over; end # Handles if someone has won or board is full
end