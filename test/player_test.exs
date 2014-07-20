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
    end) == "Please enter your move (1 - 9):\n0"
  end

  test "#get_move: gets the smart computer's move when it is the current player" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", ""]
    assert Player.get_move(%Player{type: :smart, mark: "O"}, current_board) == 8
  end


  test "#get_move: gets the dumb computer's move when it is the current player" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    computer_move = Player.get_move(%Player{type: :dumb, mark: "O"}, current_board)
    assert is_integer(computer_move) == true
  end
end

