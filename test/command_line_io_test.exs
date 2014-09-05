defmodule CommandLineIOTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  @io CommandLineIO
  @easy_computer_player EasyComputerPlayer
  @unbeatable_computer_player UnbeatableComputerPlayer
  @human_player HumanPlayer


  test "#write: displays the given message" do
    assert capture_io(fn -> CommandLineIO.write("test") end) == "test"
  end

  test "#gets: gets input from the user" do
    assert capture_io("input from command line", fn ->
      input = @io.gets("prompt: ")
      IO.write input
    end) == "prompt: input from command line"
  end

  test "#create_game_over_message: tells the user that the computer won" do
    current_board = ["O", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert @io.create_game_over_message(current_board) == "Game over! The computer won!\n"
  end

  test "#create_game_over_message: tells the user that they won" do
    current_board = ["X", "X", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert @io.create_game_over_message(current_board) == "Game over! You won!\n"
  end

  test "#create_game_over_message: tells the user its a tie" do
    current_board = ["X", "O", "X",
                     "X", "O", "X",
                     "O", "X", "O"]
    assert @io.create_game_over_message(current_board) == "Game over! It's a tie!\n"
  end

  test "#the_computer_is_playing: tells the user that the dumb computer is playing" do
    assert capture_io(fn ->
      @io.computer_playing_message(@easy_computer_player)
    end) == "\nThe dumb computer is playing...\n"
  end

  test "#the_computer_is_playing: tells the user that the smart computer is playing" do
    assert capture_io(fn ->
      @io.computer_playing_message(@unbeatable_computer_player)
    end) == "\nThe smart computer is playing...\n"
  end

  test "#the_computer_is_playing: doesn't do anything if its the human's turn" do
    assert capture_io(fn ->
      @io.computer_playing_message(@human_player)
    end) == ""
  end

  test "#get_first_or_second: returns either 'first' if the user enters 'first'" do
    assert capture_io("first", fn ->
      result = @io.get_first_or_second
      IO.write result
    end) == "Would you like to go first or second? Please enter 'first' or 'second'.\n first"
  end

  test "#get_first_or_second: returns either 'second' if the user enters 'second'" do
    assert capture_io("second", fn ->
      result = @io.get_first_or_second
      IO.write result
    end) == "Would you like to go first or second? Please enter 'first' or 'second'.\n second"
  end

  test "#get_first_or_second: continues to prompt the user until they enter 'first' or 'second' " do
    incorrect_input = "test"
    correct_input = "first"
    assert capture_io("#{incorrect_input}\n#{correct_input}", fn ->
      result = @io.get_first_or_second
      IO.write result
    end) == "Would you like to go first or second? Please enter 'first' or 'second'.\n " <>
            "Would you like to go first or second? Please enter 'first' or 'second'.\n first"
  end
end
