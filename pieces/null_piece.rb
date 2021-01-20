require 'singleton'
require_relative '../piece.rb'

class NullPiece < Piece

  include Singleton

  # Ask intializer completely overwritte (pos, color, board)?
  def initialize
    @color, @symbol = :none, " "
  end

  def empty?
    true
  end

  # def moves
  #   []
  # end

end