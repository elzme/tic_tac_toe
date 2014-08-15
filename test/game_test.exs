defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  @game Game
  @board TicTacToeBoard

  test "#play_again?: ends the program if the users doesn't want to play another game" do
    assert capture_io("no", fn ->
      input = @game.play_again?(@board)
      IO.write input
    end) == "Would you like to play again? Please enter 'yes' or 'no'.\nBye!\nok"
  end
end
