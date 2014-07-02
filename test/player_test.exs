defmodule PlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it gets the human player's move" do
    assert capture_io("1", fn ->
      input = Player.get_move
      IO.write input
    end) == "Please enter your move (1 - 9):\n1"
  end
end
