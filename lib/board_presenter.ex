defmodule BoardPresenter do
  import List, only: [replace_at: 3, to_tuple: 1]
  import Enum, only: [any?: 2, at: 2, filter_map: 3, with_index: 1]


  def display(current_board) do
    tuple = to_tuple(current_board)
    " #{elem(tuple, 0)} | #{elem(tuple, 1)} | #{elem(tuple, 2)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 3)} | #{elem(tuple, 4)} | #{elem(tuple, 5)} \n" <>
    " ___________ \n" <>
    " #{elem(tuple, 6)} | #{elem(tuple, 7)} | #{elem(tuple, 8)} \n"
  end

  def display_sample_board do
    " 1 | 2 | 3 \n" <>
    " ___________ \n" <>
    " 4 | 5 | 6 \n" <>
    " ___________ \n" <>
    " 7 | 8 | 9 "
  end
end
