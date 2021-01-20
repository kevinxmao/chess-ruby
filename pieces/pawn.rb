require_relative '../piece.rb'

class Pawn < Piece
  
  def symbol
    '♟︎'.colorize(color)
  end

  def moves
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6) 
  end

  def forward_dirs
    color == :white ? 1 : -1
  end

  def forward_steps
    cur_x, cur_y = pos

    pawn_moves = []
    one, two = [cur_x + forward_dirs, cur_y], [cur_x + 2 * forward_dirs, cur_y]

    if board.empty?(one) && board.valid_pos?(one)
        pawn_moves << one
         # check start row and move two
        if at_start_row? && board.empty?(two)
            pawn_moves << two
        end
    end

    pawn_moves
  end

  def side_attacks
    cur_x, cur_y = pos

    pawn_moves = []

    capture_l = [cur_x + forward_dirs, cur_y - 1]
    capture_r = [cur_x + forward_dirs, cur_y + 1]

    [capture_l, capture_r].each do |capture|
      if board.valid_pos?(capture) && !board.empty?(capture)
        pawn_moves << capture unless color == board[capture].color
      end
    end
    
    pawn_moves
  end
end