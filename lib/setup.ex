defmodule Setup do
  import String, only: [rstrip: 1]
  import Enum, only: [reverse: 1]
  @io  CommandLineIO

  def welcome do
    print_welcome_message
    print_display_board
  end

  def get_first_or_second do
    rstrip(@io.gets("Would you like to go first or second? Please enter 'first' or 'second'.\n "))
  end

  def get_opponent do
    rstrip(@io.gets("Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n "))
  end

  def create_players(opponent) do
    cond do
      opponent == "smart" ->
        [%Player{}, %Player{type: :smart_computer, mark: "O"}]
      opponent == "dumb" ->
        [%Player{}, %Player{type: :dumb_computer, mark: "O"}]
      true ->
        [%Player{}, %Player{type: :smart_computer, mark: "O"}]
    end
  end

  def set_first_player(first_or_second, players) do
    if first_or_second == "second" do
      reverse(players)
    else
      players
    end
  end

  def setup_new_game do
    welcome
    first_or_second? = who_goes_first?
    opponent = opponent?
    set_first_player(first_or_second?, create_players(opponent))
  end

  def who_goes_first? do
    @io.get_first_or_second
  end

  def opponent? do
    @io.get_opponent
  end

  defp print_welcome_message do
    @io.welcome_message
  end

  defp print_display_board do
    @io.display_board
  end
end
