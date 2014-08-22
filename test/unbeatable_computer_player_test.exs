defmodule UnbeatableComputerPlayerTest do
  use ExUnit.Case

  @unbeatable_computer_player UnbeatableComputerPlayer

  test "#get_move: gets the smart computer's move when it is the current player" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", ""]
    assert @unbeatable_computer_player.get_move(current_board) == 8
  end
end
