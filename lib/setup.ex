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
    first_or_second? = get_first_or_second #this will return either 'first' or 'second'
    opponent = get_opponent #this will return either 'smart' or 'dumb'
    players = set_first_player(first_or_second?, create_players(opponent)) #this reverses the list if the user wants to go second
    Game.game_loop(Board.generate_blank_board, players)
  end

  defp print_welcome_message do
    @io.write("Welcome to Elixir Tic Tac Toe!\n")
  end

  defp print_display_board do
    @io.write("Here's what the board looks like:\n#{Board.display_sample_board}\n")
  end
end
