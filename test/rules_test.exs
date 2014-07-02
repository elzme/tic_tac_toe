defmodule RulesTest do
  use ExUnit.Case

  test "#game_over?: returns true if all the spaces are full" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "O", "O", "X"]
    assert Rules.game_over?(current_board) == true
  end

  test "#game_over?: returns false if there are still spaces available" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.game_over?(current_board) == false
  end

  test "#valid_move?: returns true if the move is between 0 and 8 and if the space is empty on the board" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, "4") == true
  end

  test "#valid_move?: returns false if the move is not between 0 and 8" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, "10") == false
  end

  test "#valid_move?: returns false if the move is not blank (with a string)" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, "0") == false
  end

  test "#valid_move?: returns false if the move is not between 0 and 8 (with an integer)" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, "10") == false
  end
  test "#valid_move?: returns false if the move is not blank (with an integer )" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, 0) == false
  end
end
