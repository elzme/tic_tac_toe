defmodule HumanPlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @human_player HumanPlayer

  test "#get_move: gets the human's move when they are the current player" do
    current_board = ["", "", "",
                     "X", "", "",
                     "", "", ""]
    assert capture_io("1", fn ->
      @human_player.get_move(current_board)
    end) == "Please enter your move (1 - 9):\n"
  end
end
