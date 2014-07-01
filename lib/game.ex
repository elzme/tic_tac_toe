defmodule Game do

  def new_game do
    Setup.setup_game(IO)
    game_loop(Board.generate_blank_board)
    #until game over
    #get player move or computer move
  end

  def game_loop(current_board) do

  end
end
