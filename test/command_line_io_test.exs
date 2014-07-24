defmodule CommandLineIOTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#write: displays the given message" do
    assert capture_io(fn -> CommandLineIO.write("test") end) == "test"
  end

  test "#gets: gets input from the user" do
    assert capture_io("input from command line", fn ->
      input = CommandLineIO.gets("prompt: ")
      IO.write input
    end) == "prompt: input from command line"
  end

  test "#create_game_over_message: tells the user that the computer won" do
    current_board = ["O", "O", "X",
      "X", "O", "X",
      "O", "X", "O"]
    assert CommandLineIO.create_game_over_message(current_board) == "Game over! The computer won!\n"
  end

  test "#create_game_over_message: tells the user that they won" do
    current_board = ["X", "X", "X",
      "X", "O", "X",
      "O", "X", "O"]
    assert CommandLineIO.create_game_over_message(current_board) == "Game over! You won!\n"
  end

  test "#create_game_over_message: tells the user its a tie" do
    current_board = ["X", "O", "X",
      "X", "O", "X",
      "O", "X", "O"]
    assert CommandLineIO.create_game_over_message(current_board) == "Game over! It's a tie!\n"
  end
end
