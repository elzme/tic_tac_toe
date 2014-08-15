defmodule UnbeatableComputerPlayer do
  @computer_strategy Negamax

  defstruct type: :smart, mark: "O"

  def get_player_info do
    %UnbeatableComputerPlayer{}
  end

  def get_move(current_board) do
    @computer_strategy.get_best_move(current_board, :mark)
  end
end
