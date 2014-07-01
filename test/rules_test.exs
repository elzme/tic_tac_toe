defmodule RulesTest do
  use ExUnit.Case

  test "game_over? returns true if all the spaces are full" do
    current_board = ["X", "X", "O",
                     "X", "O", "X",
                     "O", "O", "X"]
    assert Rules.game_over?(current_board) == true
  end

  test "game_over? returns false if there are still spaces available" do
    current_board = ["X", "X", "O",
                     "X", "", "X",
                     "O", "O", "X"]
    assert Rules.game_over?(current_board) == false
  end

end
