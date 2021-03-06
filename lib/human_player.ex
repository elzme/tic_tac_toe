defmodule HumanPlayer do
  import String, only: [rstrip: 1, to_integer: 1, to_atom: 1]
  @rules Rules
  @io CommandLineIO
  @prompts TTTPrompts

  defstruct type: :human, mark: "X"

  def mark do
    %HumanPlayer{}.mark
  end

  def type do
    %HumanPlayer{}.type
  end

  def get_move(current_board) do
    position = rstrip(@io.gets(@prompts.enter_move))
    if @rules.valid_move?(current_board, position) do
      to_integer(position) - 1
    else
      get_move(current_board)
    end
  end
end
