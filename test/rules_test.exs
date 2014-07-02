defmodule RulesTest do
  use ExUnit.Case

  test "#game_over?: returns true if all the spaces are full" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "O", "O", "X"]
    assert Rules.game_over?(current_board) == true
  end

  test "#game_over?: returns true there is a winner" do
    current_board = ["X", "X", "O",
                     "X", "O", "",
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

  test "#valid_move?: returns false if the move is not blank (with an integer)" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, 0) == false
  end

  test "#valid_move?: returns false if the player enters string that isn't a number" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.valid_move?(current_board, "hey") == false
  end

  test "#winner_in_line?: returns false if the given line is all empty spaces" do
    line = [0, 1, 2]
    current_board = ["", "", "",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.winner_in_line?(current_board, line) == false
  end

  test "#winner_in_line?: returns the line if it is a winner" do
    line = [0, 1, 2]
    current_board = ["X", "X", "X",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.winner_in_line?(current_board, line) == line
  end

  test "#winner_in_line?: returns false if the line is not a winner (contains some empty spaces)" do
    line = [0, 1, 2]
    current_board = ["X", "", "X",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.winner_in_line?(current_board, line) == false
  end

  test "#winner_in_line?: returns false if the line is not a winner (contains no empty spaces)" do
    line = [0, 1, 2]
    current_board = ["X", "O", "X",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.winner_in_line?(current_board, line) == false
  end

  test "#winner_in_line?: true if winner is diagonal" do
    line = [0, 4, 8]
    current_board = ["X", "O", "X",
                     "X", "X", "X",
                     "O", "O", "X"]
    assert Rules.winner_in_line?(current_board, line) == line
  end

  test "#winner_on_board?: returns true if there is a winner anywhere on the board" do
    current_board = ["X", "X", "X",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.winner_on_board?(current_board) == true
  end

  test "#who_wins?: returns `O` if the computer wins" do
    current_board = ["X", "X", "",
                     "X", "", "X",
                     "O", "O", "O"]
    assert Rules.who_wins?(current_board) == "O"
  end

  test "#who_wins?: returns `X` if the human player wins" do
    current_board = ["X", "X", "X",
                     "X", "", "X",
                     "O", "O", ""]
    assert Rules.who_wins?(current_board) == "X"
  end

  test "#who_wins?: returns nil if its a tie" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Rules.who_wins?(current_board) == "tie"
  end
end
