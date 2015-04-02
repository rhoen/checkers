require 'colorize'
class Board

  attr_accessor :rows

  def initialize
    make_starting_grid
  end

  def make_starting_grid
    @rows = Array.new(8) {Array.new(8)}
  end

  def render
    is_white = false

    display_str = ""
    @rows.each do |row|
      row.each do |piece|
        if piece
          display_str << piece.render
        elsif is_white
          display_str << "  ".colorize(:background => :white)
        else
          display_str << "  ".colorize(:background => :light_black)
        end
        is_white = !is_white
      end.join("")
    end.join("\n")

    display_str
  end

  def even_row_pieces(row)
    cols = [0, 2, 4, 6]
    cols.each do |col|
      @rows[row, col] = Piece.new #add color of piece
    end
  end

  def odd_row_pieces(row)
    cols = [1, 3, 5, 7]
    cols.each do |col|
      @rows[row, col] = Piece.new #add color of pieces
  end

  def add_starting_pieces
    @rows.each do |row|
      row.each do |square|


  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

end
