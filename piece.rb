class Piece

  UP_DIRS = [[-1, -1], [-1, 1]]
  DOWN_DIRS = [[1, -1], [1, 1]]

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
    raise NotAvailableMoveError unless available_slide_moves.include?(to_pos)
    board[self.position] = nil
    board[to_pos] = self
    self.position = to_pos
  end

  def perform_jump

  end

  def available_slide_moves
    move_diffs.map do |diff|
      position.zip_sum(diff)
    end.select {|pos| board.on_board?(pos) && board[[pos]].nil?}
  end

  def available_jump_moves
    
  end



  def move_diffs
    if king
      UP_DIRS + DOWN_DIRS
    elsif direction == :down
      DOWN_DIRS
    else
      UP_DIRS
    end
  end

  def set_direction
    color == :black ? :down : :up
  end

end
