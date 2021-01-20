require_relative '../piece.rb'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  

  def symbol
    '♛'.colorize(color)
  end

  private

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end

# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!