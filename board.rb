require 'byebug'
require 'colorize'
require_relative 'piece'
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
      end
      display_str << "\n"
      is_white = !is_white
    end

    display_str
  end

  def add_even_row_pieces(row, color)
    cols = [0, 2, 4, 6]
    cols.each do |col|
      self[[row, col]] = Piece.new(self, color) #add color of piece
    end
  end

  def add_odd_row_pieces(row, color)
    cols = [1, 3, 5, 7]
    cols.each do |col|
      self[[row, col]] = Piece.new(self, color) #add color of pieces
    end
  end

  def add_starting_pieces
    color1 = :black
    color2 = :white
    add_even_row_pieces(0, color1)
    add_odd_row_pieces(1, color1)
    add_even_row_pieces(2, color1)

    add_odd_row_pieces(5, color2)
    add_even_row_pieces(6, color2)
    add_odd_row_pieces(7, color2)

    nil
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
