defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#switch_player: returns the computer player, if the current player is the human player" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#switch_player: returns the human player, if the current player is the computer" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#set_first_player: sets the human player as the first if the user answers `first`" do
    players = [%Player{}, %Player{type: :computer, mark: "O"}]
    assert Game.set_first_player("first", players ) == [%Player{}, %Player{type: :computer, mark: "O"}]
  end

  test "#set_first_player: sets the computer player as the first if the user answers `second`" do
    players = [%Player{}, %Player{type: :computer, mark: "O"}]
    assert Game.set_first_player("second", players ) == [%Player{type: :computer, mark: "O"}, %Player{}]
  end

  test "#set_first_player: sets the human player as the first by default" do
    players = [%Player{}, %Player{type: :computer, mark: "O"}]
    assert Game.set_first_player("", players ) == [%Player{}, %Player{type: :computer, mark: "O"}]
  end

  test "#create_game_over_message: tells the user that the computer won" do
    current_board = ["O", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! The computer won!\n"
  end

  test "#create_game_over_message: tells the user that they won" do
    current_board = ["X", "X", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! You won!\n"
  end

  test "#create_game_over_message: tells the user its a tie" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert Game.create_game_over_message(current_board) == "Game over! It's a tie!\n"
  end

  test "#play_again?: ends the program if the users doesn't want to play another game" do
    assert capture_io("no", fn ->
      input = Game.play_again?
      IO.write input
    end) == "Would you like to play again?\nBye!\nok"
  end
end
