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
    """
    1 | 2 | 3
    4 | 5 | 6
    7 | 8 | 9
    """
  end

  #TODO: need to check that the position the user enters is valid, using open_position?

  def update_board(current_board, position, mark) do
    replace_at(current_board, position, mark)
  end

  def open_position?(current_board, position) do
    Enum.at(current_board, position) == ""
  end

  def blank_spaces_left?(current_board) do
    Enum.any?(current_board, fn(x) -> x == @blank_space end)
  end

end
