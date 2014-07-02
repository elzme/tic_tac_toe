defmodule Setup do
  import String
  @io  CommandLineIO

  def print_welcome do
    @io.write("Welcome to Elixir Tic Tac Toe!\n")
  end

  def get_first_or_second do
    rstrip(@io.gets("Would you like to go first or second?\n "))
  end

  def print_display_board do
    @io.write("Here's what the board looks like:\n#{Board.display_sample_board}\n")
  end

  def setup_game do
    print_welcome
    print_display_board
    get_first_or_second
  end

  def create_players do
    [%Player{}, %Player{type: :computer, mark: "O"}]
  end
end
