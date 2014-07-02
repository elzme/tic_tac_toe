defmodule Game do

  def new_game do #NOT TESTED
    Setup.setup_game
    players = Setup.create_players
    game_loop(Board.generate_blank_board, List.first(players))
  end

  def game_loop(current_board, current_player) do #NOT TESTED
    CommandLineIO.write("\nCurrent Board:\n#{Board.display(current_board)}")
    position = Player.get_move(current_player, current_board)
    updated_board = Board.update(current_board, position, current_player.mark)
    next_player = switch_player(current_player)
    if Rules.game_over?(updated_board) do
      #game over stuff:
      CommandLineIO.write("\nCurrent Board:\n#{Board.display(updated_board)}\nGame over!")
      #play_again?
    else
      game_loop(updated_board, next_player)
    end
  end

  def switch_player(current_player) do
    if current_player == %Player{} do
      %Player{type: :computer, mark: "O"}
    else
      %Player{}
    end
  end

  #def play_again?
  #response = CommandLineIO.gets("Would you like to play again?")
  #if response == "yes"
  #  new_game do
  #else
  #  exit
  #end

end
