defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#the_computer_is_playing: tells the user that the computer is playing (if its the dumb computer's turn)" do
    assert capture_io(fn -> Game.the_computer_is_playing(%Player{type: :dumb_computer, mark: "O"}) end) == "\nThe computer is playing...\n"
  end

  test "#the_computer_is_playing: tells the user that the computer is playing (if its the smart computer's turn)" do
    assert capture_io(fn -> Game.the_computer_is_playing(%Player{type: :smart_computer, mark: "O"}) end) == "\nThe computer is playing...\n"
  end

  test "#the_computer_is_playing: doesn't do anything if its the human's turn" do
    assert capture_io(fn -> Game.the_computer_is_playing(%Player{type: :human, mark: "O"}) end) == ""
  end

  test "#switch_player: returns the computer player, if the current player is the human player" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
  end

  test "#switch_player: returns the human player, if the current player is the computer" do
    assert Game.switch_player(%Player{}) == %Player{type: :computer, mark: "O"}
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
    end) == "Would you like to play again? Please enter 'yes' or 'no'.\nBye!\nok"
  end
end
