require_relative '../piece.rb'
require_relative 'stepable'

class King < Piece
  include Stepable
  MOVES = [
    [0,1],
    [1,1],
    [1,0],
    [1,-1],
    [0,-1],
    [-1,-1],
    [-1,0],
    [-1,1]
].freeze

  def symbol
    '♚'.colorize(color)
  end

  protected

  def move_diffs
    MOVES
  end
end