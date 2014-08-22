defmodule SetupTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @human_player HumanPlayer
  @unbeatable_computer_player UnbeatableComputerPlayer
  @easy_computer_player EasyComputerPlayer

  test "#welcome: prints a welcome message and a sample board" do
    assert capture_io(fn -> Setup.welcome end) == "Welcome to Elixir Tic Tac Toe!\n" <>
                                                  "Here's what the board looks like:\n" <>
                                                              " 1 | 2 | 3 \n" <>
                                                              " ___________ \n" <>
                                                              " 4 | 5 | 6 \n" <>
                                                              " ___________ \n" <>
                                                              " 7 | 8 | 9 \n"
  end

  test "#get_first_or_second: gets if the user would like to go first or second" do
    assert capture_io("first", fn ->
       input = Setup.who_goes_first?
       IO.write input
    end) == "Would you like to go first or second? Please enter 'first' or 'second'.\n first"
  end

  test "#get_opponent: asks if the user would like to play agains a dumb computer or a smart one " do
    assert capture_io("smart", fn ->
       input = Setup.opponent?
       IO.write input
    end) == "Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n smart"
  end

  test "#create_players: creates a human and a smart computer player" do
    assert Setup.create_players("smart") == [@human_player, @unbeatable_computer_player]
  end

  test "#create_players: creates a human and a dumb computer player" do
    assert Setup.create_players("dumb") == [@human_player, @easy_computer_player]
  end

  test "#set_first_player: sets the human player as the first if the user answers `first`" do
    players = [@human_player, @unbeatable_computer_player]
    assert Setup.set_first_player("first", players ) == [@human_player, @unbeatable_computer_player]
  end

  test "#set_first_player: sets the computer player as the first if the user answers `second`" do
    players = [@human_player, @unbeatable_computer_player]
    assert Setup.set_first_player("second", players ) == [@unbeatable_computer_player, @human_player]
  end

  test "#set_first_player: sets the human player as the first by default" do
    players = [@human_player, @unbeatable_computer_player]
    assert Setup.set_first_player("", players ) == [@human_player, @unbeatable_computer_player]
  end
end
