defmodule TicTacToeBoard do
  import List, only: [replace_at: 3, to_tuple: 1, duplicate: 2]
  import Enum, only: [any?: 2, at: 2, filter_map: 3, with_index: 1]
  @blank_space ""

  def generate_blank_board(board_size) do
    duplicate(@blank_space, board_size)
  end

  def update(current_board, position, mark) do
    replace_at(current_board, position, mark)
  end

  def open_position?(current_board, position) do
    at(current_board, position) == @blank_space
  end

  def blank_spaces_left?(current_board) do
    any?(current_board, fn(x) -> x == @blank_space end)
  end

  def get_blank_spaces(current_board) do
    with_index(current_board)
    |> filter_map(fn {x, _} -> x == @blank_space end, fn {_, i} -> i end)
  end
end
