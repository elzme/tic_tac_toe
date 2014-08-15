defmodule UnbeatableComputerPlayer do
  @computer_strategy Negamax

  defstruct type: :smart, mark: "O"

  def mark do
    %UnbeatableComputerPlayer{}.mark
  end

  def type do
    %UnbeatableComputerPlayer{}.type
  end

  def get_move(current_board) do
    @computer_strategy.get_best_move(current_board, "O")
  end
end
