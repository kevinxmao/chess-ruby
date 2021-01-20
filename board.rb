require_relative 'pieces'
require_relative 'piece'

class Board

  def initialize
    
    populate
  end

  def [](pos)
    col, row = pos
    @rows[col][row]
  end

  def []=(pos, val)
    col, row = pos
    @rows[col][row] = val
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "Invalid Move" if self[start_pos].color == :null
    raise ArgumentError.new "Invalid Move" if self[end_pos].color != :null
    # raise ArgumentError.new "Invalid Move" if self[end_pos].color != :null
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def fill_back_row(color)
    back_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    row_idx = color == :black ? 0 : 7

    back_row.each_wtih_index do |piece, i|
      self[[row_idx, i]] = piece.new([row_idx, i], color, self)
    end

  end

  def fill_pawn_row(color)
    row_idx = color == :black ? 1 : 6

    (0..7).each do |i|
      self[[row_idx, i]] = Pawn.new([row_idx, i], color, self)
    end
  end
    
  end

  def populate
    @rows = Array.new(8) { Array.new(8, NullPiece.instance) }

    [:black, :white].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end
  end

end