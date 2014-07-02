defmodule Rules do
  import String
  @winning_lines [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def game_over?(current_board) do
    !(Board.blank_spaces_left?(current_board)) || Rules.winner_on_board?(current_board)
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

  def winner_in_line?(current_board, line) do
    current_line = [Enum.fetch!(current_board, Enum.fetch!(line, 0)), Enum.fetch!(current_board, Enum.fetch!(line,1)), Enum.fetch!(current_board, Enum.fetch!(line, 2))]
    if Enum.fetch!(current_board, List.first(line))  == "" do
      false
    else
      Enum.all?(current_line, fn(x) -> x == List.first(current_line) end)
    end
  end

  def winner_on_board?(current_board) do
    Enum.map(@winning_lines, fn(x) -> winner_in_line?(current_board, x) end)
    |> Enum.any?(&(&1 == true))
   end

  defp convert_potential_move_to_int(move) do #if it is not a valid input, return 100, which will fail the valid_move checker
    try do
      String.to_integer(move)
    rescue
      _ -> 100
    end
  end
end
