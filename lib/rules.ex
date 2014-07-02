defmodule Rules do
  import String

  def game_over?(current_board) do
    !(Board.blank_spaces_left?(current_board))
  end

  def valid_move?(current_board, move) do
    if is_integer(move) do
      move
    else
      move = convert_potential_move_to_int(move)
    end
    (move in ["0", 0, "1", 1, "2", 2, "3", 3, "4", 4, "5", 5, "6", 6, "7", 7, "8", 8]) &&
    (Board.open_position?(current_board, move))
  end

  defp convert_potential_move_to_int(move) do #if it is not a valid input, return 100, which will fail the valid_move checker
    try do
      String.to_integer(move)
    rescue
      _ -> 100
    end
  end
end
