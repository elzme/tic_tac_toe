defmodule Setup do
  @io  CommandLineIO

  def print_welcome do
    @io.write("Welcome to Elixir Tic Tac Toe!\n")
  end

  def get_first_or_second do
    @io.gets("Would you like to go first or second?\n ")
  end

  def print_display_board do
    @io.write("Here's what the board looks like:\n#{Board.display_sample_board}")
  end

  def setup_game do
    print_welcome
    get_first_or_second
    print_display_board
  end

  def create_players do
    [%Player{}, %Player{type: :computer, mark: "O"}]
  end
end
