class CheckersGame

  def initialize
    @board = Board.new
    # @players = {
    #   :white = Player.new(:white)
    #   :black = Playnew.new(:black)
    # }
    # @current_player = :black
  end

  def play
    
  end

  def display
    puts @board.render
    puts "Current player is: "
  end

end
