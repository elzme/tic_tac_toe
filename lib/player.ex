defmodule Player do
  defstruct type: :human, mark: "X"

  def get_move(player) do
    if player.type == :human do
      CommandLineIO.gets "Please enter your move (1 - 9):\n"
    else
      get_computer_player_move
    end
  end

  def get_computer_player_move do
    "9"
  end
end
