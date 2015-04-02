class Piece

  attr_accessor :king, :board, :color
  def initialize(board, color, king = false)
    @board = board
    @color = color
    @king = king
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

  end

  def perform_jump

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
