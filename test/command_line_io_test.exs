defmodule CommandLineIOTest do

  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it prints to the console" do
    assert capture_io(fn ->
      CommandLineIO.display_output("welcome to ttt")
    end) == "welcome to ttt\n"
  end

  test "it gets input from the console" do
    assert capture_io(fn ->
      CommandLineIO.get_input("Please enter your next move:")
    end) == "Please enter your next move:"
  end
end
