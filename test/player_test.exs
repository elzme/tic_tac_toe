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
    current_board = ["X", "X", "X",
                     "X", "X", "X",
                     "X", "X", ""]
    assert Player.get_move(%Player{type: :computer, mark: "O"}, current_board) == 8
  end
end
