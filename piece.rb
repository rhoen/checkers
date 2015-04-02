class Piece

  attr_accessor :king, :board, :color
  def initialize(board, color, king = false)
    @board = board
    @color = color
    @king = king
  end

  def render
    if king
      str = "⚙".colorize(color)
    else
      str = "☉".colorize(color)
    end

    str.colorize(:background => :black)
  end

  def perform_slide

  end

  def perform_jump

  end

  def move_diffs

  end



end
