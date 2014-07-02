defmodule BoardTest do
  use ExUnit.Case

  test "it returns a blank board" do
    assert Board.generate_blank_board == ["", "", "",
                                          "", "", "",
                                          "", "", ""]
  end

  test "it returns a sample board for the beginning of the game" do
    assert Board.display_sample_board == " 1 | 2 | 3 \n" <>
                                       " ___________ \n" <>
                                        " 4 | 5 | 6 \n" <>
                                       " ___________ \n" <>
                                         " 7 | 8 | 9 "
  end

  test "it returns the current board for display" do
    current_board = ["", "", "",
                     "X", "", "",
                     "", "", ""]
    assert Board.display_current_board(current_board) == "  |  |  \n" <>
                                                        " ___________ \n" <>
                                                         " X |  |  \n" <>
                                                        " ___________ \n" <>
                                                         "  |  |  "
  end

  test "it updates the board with the given mark at the given position" do
     current_board = ["", "", "",
                      "X", "", "",
                      "", "", ""]
     assert Board.update_board(current_board, 1, "X") ==  ["", "X", "",
                                                          "X", "", "",
                                                          "", "", ""]

  end

  test "it checks if a position is open" do
    current_board = ["", "", "",
                     "", "X", "",
                     "", "", ""]
    assert Board.open_position?(current_board, 4) == false
    assert Board.open_position?(current_board, 1) == true
  end

  test "it returns true if there are only blank spaces open" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    assert Board.blank_spaces_left?(current_board) == true
  end

  test "it returns true if there is only one blank space open" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "", "O", "X"]
    assert Board.blank_spaces_left?(current_board) == true
  end

  test "it returns false if there are no blank spaces open" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "O", "O", "X"]
    assert Board.blank_spaces_left?(current_board) == false
  end
end
