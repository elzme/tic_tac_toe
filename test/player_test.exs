defmodule PlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it gets the human's move when they are the current player" do
    assert capture_io("1", fn ->
      input = Player.get_move(%Player{})
      IO.write input
    end) == "Please enter your move (1 - 9):\n1"
  end

  test "it gets the computers move when it is the current player" do
    assert Player.get_move(%Player{type: :computer, mark: "O"}) == "9"
  end
end
