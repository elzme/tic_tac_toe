defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#switch_player: returns the computer player, if the current player is the human player" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#switch_player: returns the human player, if the current player is the computer" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end
end
