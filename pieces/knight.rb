require_relative '../piece.rb'
require_relative 'stepable'

class Knight < Piece
  include Stepable
    MOVES = [
    [2,1],
    [-2,1],
    [1,2],
    [1,-2],
    [2,-1],
    [-1,-2],
    [-1,2],
    [-2,-1]
].freeze

  def symbol
    '♞'.colorize(color)
  end

  protected

  def move_diffs
    MOVES
  end
end