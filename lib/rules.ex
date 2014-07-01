defmodule Rules do
  def game_over?(current_board) do
    !(Board.blank_spaces_left?(current_board))
  end
end
