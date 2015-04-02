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

  end

  def set_direction
    color == :black ? :down : :up
  end

end
