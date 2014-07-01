defmodule CommandLineIOTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "displays the given message" do
    assert capture_io(fn -> CommandLineIO.write("test") end) == "test"
  end

  test "gets input from the user" do
    assert capture_io("input from command line", fn ->
      input = CommandLineIO.gets("prompt: ")
      IO.write input
    end) == "prompt: input from command line"
  end
end
