module Stepable

  def moves
    moves_arr = []

    move_diffs.each do |move|

      dx, dy = move
      cur_pos = pos
      pos = [cur_pos[0] + dx, cur_pos[1] + dy]

      if boad.valid_pos?(pos)

        if board.empty?(pos)
          moves_arr << pos
        else
          moves_arr << pos unless self.color == board[pos].color
        end

      end

    end

    moves_arr
  end

  private

  def move_diffs
    raise NotImplementedError
  end

end