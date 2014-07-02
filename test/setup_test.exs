defmodule SetupTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it prints a welcome" do
    assert capture_io(fn -> Setup.print_welcome end) == "Welcome to Elixir Tic Tac Toe!"
  end

  test "it gets if the user would like to go first or second" do
    assert capture_io("first", fn ->
       input = Setup.get_first_or_second
       IO.write input
    end) == "Would you like to go first or second?\n first"
  end

  test "it prints out a display board" do
    assert capture_io(fn -> Setup.print_display_board end) == "Here's what the board looks like:\n" <>
                                                              " 1 | 2 | 3 \n" <>
                                                              " ___________ \n" <>
                                                              " 4 | 5 | 6 \n" <>
                                                              " ___________ \n" <>
                                                              " 7 | 8 | 9 "
  end

  test "create_players" do
    assert Setup.create_players == [%Player{}, %Player{type: :computer, mark: "O"}]
  end
end
