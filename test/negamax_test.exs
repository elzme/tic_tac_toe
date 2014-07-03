defmodule NegamaxTest do
  use ExUnit.Case

  test "#get_score: returns a 1 if the current player wins" do
    current_board = ["X", "X", "X",
                     "", "", "",
                     "", "", ""]
    assert Negamax.get_score(current_board, "X") == 100
  end

  test "#get_score: returns a -1 if the current player loses" do
    current_board = ["X", "X", "X",
                     "", "", "",
                     "", "", ""]
    assert Negamax.get_score(current_board, "O") == -100
  end

  test "#get_score: returns a 0 if the game ends in a tie" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Negamax.get_score(current_board, "O") == 0
  end

  test "#score_move returns a list with the score and the move if the move causes the game to be over" do
    current_board = ["X", "X", "",
                     "", "", "",
                     "", "", ""]
    assert Negamax.score_move(current_board, "X", 2, 0) == [100, 2]
  end

  test "#switch_player_mark: returns `X` if `O` is the current player's mark" do
    assert Negamax.switch_player_mark("X") == "O"
  end

  test "#switch_player_mark: returns `O` if `X` is the current player's mark" do
    assert Negamax.switch_player_mark("O") == "X"
  end

  test "#get_best_move: it takes the winning move for the computer" do
    current_board = ["X", "O", "",
                     "O", "O", "",
                     "X", "X", "O"]
    assert Negamax.get_best_move(current_board, "O") == 5
  end


  test "#get_best_move: it takes the tying move instead of losing" do
    current_board = ["X", "X", "",
                     "O", "X", "",
                     "X", "O", "O"]
    assert Negamax.get_best_move(current_board, "O") == 2
  end

  test "#get_best_move: it takes the winning move instead of tying" do
    current_board = ["X", "X", "",
                     "O", "O", "",
                     "X", "O", "O"]
    assert Negamax.get_best_move(current_board, "O") == 5
  end

  test "#get_best_move: it blocks the opponent" do
    current_board = ["X", "", "",
                     "", "X", "",
                     "", "O", ""]
    assert Negamax.get_best_move(current_board, "O") == 8
  end

  test "#get_best_move: gets the quickest win" do
    current_board = ["X", "", "",
                     "O", "O", "",
                     "X", "", ""]
    assert Negamax.get_best_move(current_board, "O") == 5
  end
end
