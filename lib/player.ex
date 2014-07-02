defmodule Player do
  import String
  defstruct type: :human, mark: "X"

  def get_move(player, current_board) do
    if player.type == :human do
      position = CommandLineIO.gets "Please enter your move (1 - 9):\n"
      to_integer(rstrip(position))
    else
      get_computer_player_move(current_board)
    end
  end

  def get_computer_player_move(current_board) do
    String.to_integer("8")
  end
end
