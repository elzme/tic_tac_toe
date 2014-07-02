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

  test "#create_game_over_message: tells the user that the computer won" do
    current_board = ["O", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! The computer won!"
  end

  test "#create_game_over_message: tells the user that they won" do
    current_board = ["X", "X", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! You won!"
  end

  test "#create_game_over_message: tells the user its a tie" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! It's a tie!"
  end
end
