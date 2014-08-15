defmodule EasyComputerPlayerTest do
  use ExUnit.Case

  @easy_computer_player EasyComputerPlayer

  test "#get_move: gets the dumb computer's move when it is the current player" do
    current_board = ["", "", "",
                     "", "", "",
                     "", "", ""]
    computer_move = @easy_computer_player.get_move(current_board)
    assert is_integer(computer_move) == true
  end
end

