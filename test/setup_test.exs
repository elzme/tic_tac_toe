defmodule SetupTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it prints a welcome" do
    assert capture_io(fn -> Setup.print_welcome end) == "Welcome to Elixir Tic Tac Toe! Would you like to go first or second?"
  end

  test "it gets if the user would like to go first or second" do
    assert capture_io("first", fn ->
       input = Setup.get_first_or_second
       IO.write input
    end) == "> first"
  end

  test "it prints out a display board" do
    assert capture_io(fn -> Setup.print_display_board end) == """
                                                              Here's what the board looks like:
                                                              1 | 2 | 3
                                                              4 | 5 | 6
                                                              7 | 8 | 9
                                                              """
  end
end
