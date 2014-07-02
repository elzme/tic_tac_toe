defmodule Game do

  def new_game do #NOT TESTED
    first_or_second? = Setup.setup_game
    game_loop(Board.generate_blank_board, set_first_player(first_or_second?))
  end

  def game_loop(current_board, current_player) do #NOT TESTED
    CommandLineIO.write("\nCurrent Board:\n#{Board.display(current_board)}")
    position = Player.get_move(current_player, current_board)
    updated_board = Board.update(current_board, position, current_player.mark)
    next_player = switch_player(current_player)
    if Rules.game_over?(updated_board) do
      #game over stuff:
      CommandLineIO.write("\nCurrent Board:\n#{Board.display(updated_board)}\n#{create_game_over_message(updated_board)}")
      #play_again?
    else
      game_loop(updated_board, next_player)
    end
  end

  def set_first_player(answer_from_user) do
    if answer_from_user == "first" || answer_from_user == "First" do
      %Player{}
    else
      %Player{type: :computer, mark: "O"}
    end
  end

  def switch_player(current_player) do
    if current_player == %Player{} do
      %Player{type: :computer, mark: "O"}
    else
      %Player{}
    end
  end

  def create_game_over_message(current_board) do
    result = Rules.who_wins?(current_board)
    cond do
      result == "O" ->
        "Game over! The computer won!"
      result == "X" ->
        "Game over! You won!"
      result == "tie" ->
        "Game over! It's a tie!"
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
