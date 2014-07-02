defmodule Player do
  import String

  defstruct type: :human, mark: "X"

  def get_move(player, current_board) do
    cond do
      player.type == :human ->
        get_human_player_move(player, current_board)
      player.type == :computer ->
        get_computer_player_move(current_board)
    end
  end

  def get_computer_player_move(current_board) do
    8
  end

  defp get_human_player_move(player, current_board) do
    position = rstrip(CommandLineIO.gets "Please enter your move (1 - 9):\n")
    if Rules.valid_move?(current_board, position) do
      to_integer(position)
    else
      get_move(player, current_board)
    end
  end
end
