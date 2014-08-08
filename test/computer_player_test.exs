defmodule ComputerPlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @human_player HumanPlayer
  @computer_player ComputerPlayer

  test "#get_move: gets the human's move when they are the current player" do
    current_board = ["", "", "",
                     "X", "", "",
                     "", "", ""]
    assert capture_io("1", fn ->
      input = @human_player.get_move(%HumanPlayer{}, current_board)
    end) == "Please enter your move (1 - 9):\n"
  end

  test "#get_move: gets the smart computer's move when it is the current player" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", ""]
    assert @computer_player.get_move(%ComputerPlayer{type: :smart, mark: "O"}, current_board) == 8
  end


  test "#get_move: gets the dumb computer's move when it is the current player" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    computer_move = @computer_player.get_move(%ComputerPlayer{type: :dumb, mark: "O"}, current_board)
    assert is_integer(computer_move) == true
  end
end

