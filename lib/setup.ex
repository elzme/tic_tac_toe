defmodule Setup do
  @io  CommandLineIO

  def print_welcome(io) do
    @io.write("Welcome to Elixir Tic Tac Toe! Would you like to go first or second?")
  end

  def get_first_or_second(io) do
    @io.gets("> ")
  end

  def print_display_board(io) do
    @io.write("Here's what the board looks like:\n#{Board.display_board}")
  end

  def setup_game(io) do
    IO.puts "in setup game"
    print_welcome(io)
    get_first_or_second(io)
    print_display_board(io)
  end
end
