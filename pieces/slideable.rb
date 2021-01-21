module Slideable

  HORIZONTAL_DIRS = [
    [1,0],
    [0,1],
    [-1,0],
    [0,-1]
  ].freeze

  DIAGONAL_DIRS = [
    [1,1],
    [1,-1],
    [-1,-1],
    [-1,1]
  ].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    moves_arr = []

    move_dirs.each do |move|
      dx, dy = move
      moves_arr.concat(grow_unblocked_moves_in_dir(dx,dy))
    end

    moves_arr
  end

  private

  def move_dirs
    raise NotImplementedError
  end


  def grow_unblocked_moves_in_dir(dx, dy)

    grown_moves = []
    
    loop do
      
      cur_pos = self.pos
      pos = [cur_pos[0] + dx, cur_pos[1] + dy]
      
      break unless board.valid_move?(pos)
      
      if board.empty?(pos)
        grown_moves << pos 
      else
        grown_moves << pos if self.color != board[pos].color
        break
      end
      
    end

    grown_moves
  end

end