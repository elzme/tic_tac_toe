defmodule Game do

  def new_game do
    Setup.setup_game
    game_loop(Board.generate_blank_board, %Player{})
    #get player move or computer move
  end

  def game_loop(current_board, current_player) do
   CommandLineIO.write("\nCurrent Board:\n#{Board.display_current_board(current_board)}")
   Player.get_move(current_player)
   #updated_board = Board.update(current_board, current_player.get_move, current_player.mark)
   #unless Rules.game_over?(updated_board) do
   #  game_loop(updated_board)
   #game_over stuff
  end
end
