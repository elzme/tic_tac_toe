defmodule Setup do
  import Enum, only: [reverse: 1]
  @io  CommandLineIO
  @computer_player ComputerPlayer
  @human_player HumanPlayer
  @unbeatable_computer_player UnbeatableComputerPlayer
  @easy_computer_player EasyComputerPlayer

  def welcome do
    print_welcome_message
    print_display_board
  end

  def create_players(type_of_opponent) do
    [@human_player.get_player_info, @computer_player.get_player_info(type_of_opponent)]
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
