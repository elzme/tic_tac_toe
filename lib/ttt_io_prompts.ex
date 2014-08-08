defmodule TTTPrompts do
  def welcome_to_game do
   "Welcome to Elixir Tic Tac Toe!\n"
  end

  def heres_the_board(board) do
    "Here's what the board looks like:\n" <>
    "#{board}" <>
    "\n"
  end

  def first_or_second do
    "Would you like to go first or second? Please enter 'first' or 'second'.\n "
  end

  def opponent do
    "Would you like to play against the smart computer, or the dumb computer? Please enter 'smart' or 'dumb'.\n "
  end

  def play_again? do
    "Would you like to play again? Please enter 'yes' or 'no'.\n"
  end

  def bye do
    "Bye!\n"
  end

  def enter_move do
    "Please enter your move (1 - 9):\n"
  end
end
