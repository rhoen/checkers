class Board

  attr_accessor :rows
  
  def initialize
    make_starting_grid
  end

  def make_starting_grid
    @rows = Array.new(8) {Array.new(8)}
  end

end
