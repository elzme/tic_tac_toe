defmodule Rules do
  import String

  def game_over?(current_board) do
    !(Board.blank_spaces_left?(current_board))
  end

  def valid_move?(current_board, move) do
    (move in ["0", 0, "1", 1, "2", 2, "3", 3, "4", 4, "5", 5, "6", 6, "7", 7, "8", 8]) &&
    (Board.open_position?(current_board, to_integer(move)))
  end
end
