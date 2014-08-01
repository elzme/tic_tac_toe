defmodule TicTacToeBoardTest do
  use ExUnit.Case
  @board  TicTacToeBoard

  test "#generate_blank_board: returns a blank board" do
    assert @board.generate_blank_board == ["", "", "",
                                          "", "", "",
                                          "", "", ""]
  end

  test "#update: updates the board with the given mark at the given position" do
     current_board = ["", "", "",
                      "X", "", "",
                      "", "", ""]
     assert @board.update(current_board, 1, "X") ==  ["", "X", "",
                                                          "X", "", "",
                                                          "", "", ""]

  end

  test "#open_position: checks if a position is open" do
    current_board = ["", "", "",
                     "", "X", "",
                     "", "", ""]
    assert @board.open_position?(current_board, 4) == false
    assert @board.open_position?(current_board, 1) == true
  end

  test "#blank_spaces_left?: returns true if there are only blank spaces open" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    assert @board.blank_spaces_left?(current_board) == true
  end

  test "#blank_spaces_left?: returns true if there is only one blank space open" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "", "O", "X"]
    assert @board.blank_spaces_left?(current_board) == true
  end

  test "#blank_spaces_left?: returns false if there are no blank spaces open" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "O", "O", "X"]
    assert @board.blank_spaces_left?(current_board) == false
  end

  test "#get_blank_spaces: returns a list of all the blanks spaces left" do
    current_board = ["", "X", "O",
                     "X", "", "X",
                     "O", "", "X"]
    assert @board.get_blank_spaces(current_board) == [0, 4, 7]
  end

  test "#get_blank_spaces: returns an empty list if there are no blank spaces" do
    current_board = ["X", "X", "O",
                     "X", "X", "X",
                     "O", "X", "X"]
    assert @board.get_blank_spaces(current_board) == []
  end
end
