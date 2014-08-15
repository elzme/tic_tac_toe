defmodule EasyComputerPlayer do
  @rules Rules

  defstruct type: :dumb, mark: "O"

  def mark do
    %EasyComputerPlayer{}.mark
  end

  def type do
    %EasyComputerPlayer{}.type
  end

  def get_move(current_board) do
    position = :crypto.rand_uniform(0,8)
    if @rules.valid_move?(current_board, position) do
      position
    else
      get_move(current_board)
    end
  end
end
