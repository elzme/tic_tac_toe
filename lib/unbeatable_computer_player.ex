defmodule UnbeatableComputerPlayer do
  @computer_strategy Negamax

  defstruct type: :smart, mark: "O"

  def get_move(current_board, computer_mark) do
    @computer_strategy.get_best_move(current_board, computer_mark)
  end
end
