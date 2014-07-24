defmodule CommandLineIO do
  import String, only: [rstrip: 1]

  def write(msg) do
    IO.write(msg)
  end

  def gets(msg) do
    IO.gets(msg)
  end

  def welcome_message do
    write("Welcome to Elixir Tic Tac Toe!\n")
  end

  def display_board do
    write("Here's what the board looks like:\n#{Board.display_sample_board}\n")
  end

  def get_first_or_second do
    rstrip(gets("Would you like to go first or second? Please enter 'first' or 'second'.\n "))
  end

  def get_opponent do
    opponent = rstrip(gets("Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n "))
    unless opponent == "smart" || opponent == "dumb" do
       get_opponent
    end
    opponent
  end

  def ask_if_user_wants_to_play_again do
    rstrip(gets("Would you like to play again? Please enter 'yes' or 'no'.\n"))
  end

  def say_goodbye do
    write("Bye!\n")
  end

  def display_current_board(updated_board) do
    write("\nCurrent Board:\n#{updated_board.display(updated_board)}")
  end
end
