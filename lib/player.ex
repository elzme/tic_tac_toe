defmodule Player do
  import String, only: [rstrip: 1, to_integer: 1, to_atom: 1]

  defstruct type: :human, mark: "X"

  def create_human_player do
    %Player{}
  end

  def create_computer_player(player_type) do
    %Player{type: to_atom(player_type), mark: "O"}
  end

  def get_move(player, current_board) do
    cond do
      player.type == :human ->
        get_human_player_move(player, current_board)
      player.type == :smart ->
        get_unbeatable_computer_player_move(current_board, player.mark)
      player.type == :dumb ->
        get_easy_computer_player_move(current_board)
    end
  end

  defp get_easy_computer_player_move(current_board) do
    position = :crypto.rand_uniform(0,8)
    if Rules.valid_move?(current_board, position) do
      position
    else
      get_easy_computer_player_move(current_board)
    end
  end

  defp get_unbeatable_computer_player_move(current_board, computer_mark) do
    Negamax.get_best_move(current_board, computer_mark)
  end

  defp get_human_player_move(player, current_board) do
    position = rstrip(CommandLineIO.gets "Please enter your move (1 - 9):\n")
    if Rules.valid_move?(current_board, position) do
      to_integer(position) - 1
    else
      get_human_player_move(player, current_board)
    end
  end
end
