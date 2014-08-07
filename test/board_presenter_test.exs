defmodule BoardPresenterTest do
  use ExUnit.Case
  @presenter BoardPresenter

  test "#display_sample_board: returns a sample board for the beginning of the game" do
    assert @presenter.display_sample_board == " 1 | 2 | 3 \n" <>
                                       " ___________ \n" <>
                                        " 4 | 5 | 6 \n" <>
                                       " ___________ \n" <>
                                         " 7 | 8 | 9 "
  end

  test "#display: returns the current board for display" do
    current_board = ["", "", "",
                     "X", "", "",
                     "", "", ""]
    assert @presenter.display(current_board) == "  |  |  \n" <>
                                            " ___________ \n" <>
                                            " X |  |  \n" <>
                                            " ___________ \n" <>
                                            "  |  |  \n"
  end


end
