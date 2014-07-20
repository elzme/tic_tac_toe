defmodule Rules do

  import Enum, only: [all?: 2, fetch!: 2, filter: 2, map: 2]
  import List, only: [flatten: 1, first: 1]
  import String, only: [to_integer: 1]
  @blank_space ""
  @winning_lines [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def game_over?(current_board) do
    !(Board.blank_spaces_left?(current_board)) || Rules.winner_on_board?(current_board)
  end

  def valid_move?(current_board, move) do
    if is_integer(move) do
      move
    else
      move = convert_potential_move_to_int(move) - 1
    end
    (move in [0, 1, 2, 3, 4, 5, 6, 7, 8]) && (Board.open_position?(current_board, move))
  end

  def winner_in_line?(current_board, line) do
    current_line = get_current_line_values(current_board, line)
    are_all_marks_the_same? = all_marks_the_same?(current_line)
    if (fetch!(current_board, first(line))  == @blank_space) || (!are_all_marks_the_same?) do
      false
    else
      line
    end
  end

  def winner_on_board?(current_board) do
    length(iterate_through_winning_possibilities(current_board)) > 0
  end

  def who_wins?(current_board) do
    winning_line = iterate_through_winning_possibilities(current_board)
    if length(winning_line) > 0 do
      fetch!(current_board, first(winning_line))
    else
     "tie"
    end
  end

  defp get_current_line_values(current_board, line) do
    [fetch!(current_board, fetch!(line, 0)),
     fetch!(current_board, fetch!(line,1)),
     fetch!(current_board, fetch!(line, 2))]
  end

  defp all_marks_the_same?(current_line) do
     all?(current_line, fn(x) -> x == first(current_line) end)
  end

  defp iterate_through_winning_possibilities(current_board) do
    map(@winning_lines, fn(x) -> winner_in_line?(current_board, x) end)
    |> filter(&(&1 != false))
    |> flatten
  end

  defp convert_potential_move_to_int(move) do #if it is not a valid input, return 100, which will fail the valid_move checker
    try do
      to_integer(move)
    rescue
      _ -> 100
    end
  end
end
