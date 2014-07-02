defmodule Board do

  import List
  import Enum
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

  #TODO: need to check that the position the user enters is valid, using open_position?

  def update(current_board, position, mark) do
    replace_at(current_board, position, mark)
  end

  def open_position?(current_board, position) do
    Enum.at(current_board, position) == ""
  end

  def blank_spaces_left?(current_board) do
    Enum.any?(current_board, fn(x) -> x == @blank_space end)
  end

  def display(current_board) do
    tuple = to_tuple(current_board)
    " #{elem(tuple, 0)} | #{elem(tuple, 1)} | #{elem(tuple, 2)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 3)} | #{elem(tuple, 4)} | #{elem(tuple, 5)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 6)} | #{elem(tuple, 7)} | #{elem(tuple, 8)} \n"

  end
end
