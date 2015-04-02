class Piece

  attr_accessor :king, :board, :color, :position, :direction
  def initialize(board, position, color, king = false)
    @board = board
    @color = color
    @king = king
    @position = position
    @direction = set_direction
  end

  def render
    if king
      str = "⚙ ".colorize(color)
    else
      str = "☉ ".colorize(color)
    end

    str.colorize(:background => :light_black)
  end

  def perform_slide(to_pos)
    raise NotAvailableMoveError unless available_moves.include?(to_pos)
    board[self.position] = nil
    board[to_pos] = self
    self.position = to_pos
  end

  def perform_jump

  end

  def available_moves
    move_diffs.map do |diff|
      position.zip_sum(diff)
    end.reject {|pos| board.on_board?(pos)}
  end

  def move_diffs
    up = [[-1, -1], [-1, 1]]
    down = [[1, -1], [1, 1]]
    if king
      up.concat(down)
    elsif direction == :down
      down
    else
      up
    end
  end

  def set_direction
    color == :black ? :down : :up
  end

end
