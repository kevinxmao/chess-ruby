require_relative 'pieces'
require_relative 'piece'

class Board

  def initialize
    @null = NullPiece.instance
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

  def move_piece(color, start_pos, end_pos)
    # raise ArgumentError.new "Invalid Move" if self[start_pos].color == :null
    # raise ArgumentError.new "Invalid Move" if self[end_pos].color != :null
    raise 'No piece at selected position' if self[start_pos].empty?

    piece = self[start_pos]
    if piece.color != color
      raise 'Not your piece'
    elsif !piece.moves.include?(end_pos)
      raise 'Not a valid way to move your piece'
    end

    move_piece!(color, start_pos, end_pos)

  end
  
  def move_piece!(color, start_pos, end_pos)
    piece = self[start_pos]
    oppo = self[end_pos]

    self[start_pos] = null
    self[end_pos] = piece
    piece.pos = end_pos
  end
  
  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  # def add_piece(piece, pos)
  #   # retired method
  # end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
    dup_board = @rows.map do |row|
      row.map do |piece|
        if piece.empty?
          null
        else
          piece.class.new(piece.pos, piece.color, self)
        end
      end
    end

    return dup_board
  end

  private

  attr_reader :null

  def fill_back_row(color)
    back_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    row_idx = color == :black ? 0 : 7

    back_row.each.with_index do |piece, i|
      self[[row_idx, i]] = piece.new([row_idx, i], color, self)
    end

  end

  def fill_pawn_row(color)
    row_idx = color == :black ? 1 : 6

    (0..7).each do |i|
      self[[row_idx, i]] = Pawn.new([row_idx, i], color, self)
    end
  end

  def populate
    @rows = Array.new(8) { Array.new(8, null) }

    [:black, :white].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end
  end

end