class Player
  def initialize(color)
    @color = color
  end
  def get_input
    NotImplementedError
  end
end

class HumanPlayer < Player
  def get_input
    puts "Please enter the location of the piece you would like to move
    followed the location to move it to. You may chain multiple jumps by
    including each jump as a separate move. e.g.: a3 b5 c7"
    input = gets.chomp
    input = input.split(' ')
    piece = input[0]
    move_sequence = input[1..-1]
  end
end

class ComputerPlayer < Player

end
