class Piece

  attr_accessor :king, :board
  def initialize(board, king = false)
    @king = king
    @board = board
  end

  

end
