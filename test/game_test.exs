defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#switch_player: returns the computer player, if the current player is the human player" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#switch_player: returns the human player, if the current player is the computer" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#set_first_player: sets the human player if the user answers `first`" do
    assert Game.set_first_player("first") == %Player{}
  end

  test "#set_first_player: sets the computer player if the user answers `second`" do
    assert Game.set_first_player("second") == %Player{type: :computer, mark: "O"}
  end
end
