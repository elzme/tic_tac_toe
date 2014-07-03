defmodule SetupTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "#welcome: prints a welcome message and a sample board" do
    assert capture_io(fn -> Setup.welcome end) == "Welcome to Elixir Tic Tac Toe!\n" <>
                                                        "Here's what the board looks like:\n" <>
                                                              " 0 | 1 | 2 \n" <>
                                                              " ___________ \n" <>
                                                              " 3 | 4 | 5 \n" <>
                                                              " ___________ \n" <>
                                                              " 6 | 7 | 8 \n"
  end

  test "#get_first_or_second: gets if the user would like to go first or second" do
    assert capture_io("first", fn ->
       input = Setup.get_first_or_second
       IO.write input
    end) == "Would you like to go first or second? Please enter 'first' or 'second'.\n first"
  end

  test "#get_opponent: asks if the user would like to play agains a dumb computer or a smart one " do
    assert capture_io("smart", fn ->
       input = Setup.get_opponent
       IO.write input
    end) == "Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n smart"
  end

  test "#create_players: creates a human and a smart computer player" do
    assert Setup.create_players("smart") == [%Player{}, %Player{type: :smart_computer, mark: "O"}]
  end

  test "#create_players: creates a human and a dumb computer player" do
    assert Setup.create_players("dumb") == [%Player{}, %Player{type: :dumb_computer, mark: "O"}]
  end

  test "#create_players: creates a human and a smart computer player, by default" do
    assert Setup.create_players("misspelled word") == [%Player{}, %Player{type: :smart_computer, mark: "O"}]
  end

  test "#set_first_player: sets the human player as the first if the user answers `first`" do
    players = [%Player{}, %Player{type: :smart_computer, mark: "O"}]
    assert Setup.set_first_player("first", players ) == [%Player{}, %Player{type: :smart_computer, mark: "O"}]
  end

  test "#set_first_player: sets the computer player as the first if the user answers `second`" do
    players = [%Player{}, %Player{type: :smart_computer, mark: "O"}]
    assert Setup.set_first_player("second", players ) == [%Player{type: :smart_computer, mark: "O"}, %Player{}]
  end

  test "#set_first_player: sets the human player as the first by default" do
    players = [%Player{}, %Player{type: :smart_computer, mark: "O"}]
    assert Setup.set_first_player("", players ) == [%Player{}, %Player{type: :smart_computer, mark: "O"}]
  end
end
