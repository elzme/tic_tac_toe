defmodule PlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#get_move: gets the human's move when they are the current player" do
    current_board = ["", "", "",
                     "X", "", "",
                     "", "", ""]
    assert capture_io("1", fn ->
      input = Player.get_move(%Player{}, current_board)
      IO.write input
    end) == "Please enter your move (1 - 9):\n1"
  end

  test "#get_move: gets the computers move when it is the current player" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    computer_move = Player.get_move(%Player{type: :computer, mark: "O"}, current_board)
    assert is_integer(computer_move) == true
  end

  test "#get_score: returns a 1 if the current player wins" do
    current_board = ["X", "X", "X",
                     "", "", "",
                     "", "", ""]
    assert Player.get_score(current_board, "X") == 1
  end

  test "#get_score: returns a -1 if the current player loses" do
    current_board = ["X", "X", "X",
                     "", "", "",
                     "", "", ""]
    assert Player.get_score(current_board, "O") == -1
  end

  test "#get_score: returns a 0 if the game ends in a tie" do
    current_board = ["X", "X", "X",
                     "", "", "",
                     "", "", ""]
    assert Player.get_score(current_board, "O") == -1
  end
end
