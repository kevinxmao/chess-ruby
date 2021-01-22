class Piece

  attr_accessor :pos
  attr_reader :color, :board

  def initialize(pos, color, board)

    @pos = pos
    @color = color
    @board = board

  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end

  def valid_moves
    moves.select { |move| !move_into_check?(move) }
  end

  def symbol
    raise NotImplementedError
  end

  private

  def move_into_check?(pos)
    false
  end

end