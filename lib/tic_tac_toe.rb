class TicTacToe


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move (index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
     @board[index] != " "
  end

  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end

  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
counter = 0
@board.each do |index|
  if index == "X" || index == "O"
    counter += 1
  end
end
 return counter
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end

def full?
   @board.all? {|index| index == "X" || index == "O"}
end


  def draw?
   !won? && full?
end


  def over?
 won? || draw? || full?
 end



def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  while !over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
