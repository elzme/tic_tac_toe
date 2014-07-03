defmodule Setup do
  import String
  @io  CommandLineIO

  def print_welcome do
    @io.write("Welcome to Elixir Tic Tac Toe!\n")
  end

  def get_first_or_second do
    rstrip(@io.gets("Would you like to go first or second? Please enter 'first' or 'second'.\n "))
  end

  def print_display_board do
    @io.write("Here's what the board looks like:\n#{Board.display_sample_board}\n")
  end

  def choose_opponent do
    rstrip(@io.gets("Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n "))
  end

  def setup_game do
    print_welcome
    print_display_board
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
end
