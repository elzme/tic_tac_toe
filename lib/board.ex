defmodule Board do

  import List, only: [replace_at: 3, to_tuple: 1]
  import Enum, only: [any?: 2, at: 2, filter_map: 3, with_index: 1]
  @blank_space ""

  def generate_blank_board do
    [@blank_space, @blank_space, @blank_space,
     @blank_space, @blank_space, @blank_space,
     @blank_space, @blank_space, @blank_space]
  end

  def display_sample_board do
    " 1 | 2 | 3 \n" <>
    " ___________ \n" <>
    " 4 | 5 | 6 \n" <>
    " ___________ \n" <>
    " 7 | 8 | 9 "
  end

  def display(current_board) do
    tuple = to_tuple(current_board)
    " #{elem(tuple, 0)} | #{elem(tuple, 1)} | #{elem(tuple, 2)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 3)} | #{elem(tuple, 4)} | #{elem(tuple, 5)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 6)} | #{elem(tuple, 7)} | #{elem(tuple, 8)} \n"
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
