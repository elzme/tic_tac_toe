defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  @game Game
  @board TicTacToeBoard
  @player Player

  test "#the_computer_is_playing: tells the user that the computer is playing" do
    assert capture_io(fn -> @game.the_computer_is_playing(%EasyComputerPlayer{}) end) == "\nThe computer is playing...\n"
  end

  test "#the_computer_is_playing: doesn't do anything if its the human's turn" do
    assert capture_io(fn -> @game.the_computer_is_playing(%HumanPlayer{}) end) == ""
  end

  test "#play_again?: ends the program if the users doesn't want to play another game" do
    assert capture_io("no", fn ->
      input = @game.play_again?(@board, @player)
      IO.write input
    end) == "Would you like to play again? Please enter 'yes' or 'no'.\nBye!\nok"
  end
end
