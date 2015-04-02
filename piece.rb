require 'byebug'
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
    move(to_pos)
    true
  end

  def perform_jump(to_pos)
    raise NotAvailableMoveError unless available_jump_moves.include?(to_pos)
    direction_moved = to_pos.zip_difference(self.position)
    captured = self.position.zip_sum(direction_moved)
    board[captured] = nil
    move(to_pos)
    true
  end

  def move(to_pos)
    board[self.position] = nil
    board[to_pos] = self
    self.position = to_pos
  end

  # def move!(to_pos)
  #   new_board = board.dup
  #   new_board[self.position] = nil
  #   new_board[to_pos] = self.dup
  #   new_board[to_pos].position = to_pos
  # end

  def available_slide_moves
    move_diffs.map do |diff|
      position.zip_sum(diff)
    end.select {|pos| board.on_board?(pos) && board[pos].nil?}
  end

  def available_jump_moves(pos = self.position)
    moves = []
    move_diffs.each do |diff|
      adjacent_space = pos.zip_sum(diff)
      next_space = adjacent_space.zip_sum(diff)
      square = board[adjacent_space]
      if square.is_a?(Piece) && square.color != color && board[next_space].nil?
        moves << next_space
      end
    end

    moves
  end

  def perform_moves!(move_sequence)
    new_board = board.dup
    if move_sequence.size == 1
      break if new_board[self.position].perform_slide(move_sequence.first)
      new_board[self.position].perform_jump(move_sequence.first)
    elsif move_sequence.size > 1
      move_sequence.each do |move|
        new_board[self.position].perform_jump(move)
      end
    end
  rescue
    raise InvalidMoveError
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
