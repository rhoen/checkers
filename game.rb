class CheckersGame

  def initialize
    @board = Board.new
    @players = {
      :white = Player.new(:white)
      :black = Playnew.new(:black)
    }
    @current_player = :black
  end

  def play
    until board.over?
      display
      puts "Current player is: "
      input = @current_player.get_input
      move(input)
      @current_player == :white ? :white : :black
    end
    puts "The winner is: #{board.winner}"
  end

  def display
    puts @board.render
  end

  def move(input)
    piece, move_sequence = input
    piece.perform_moves(move_sequence)
  end

end

if __FILE__ == $PROGRAM_NAME
  
end
