defmodule CommandLineIO do
  import String, only: [match?: 2, replace: 3, rstrip: 1]
  @rules Rules
  @presenter BoardPresenter
  @prompts TTTPrompts

  def write(msg) do
    IO.write(msg)
  end

  def gets(msg) do
    IO.gets(msg)
  end

  def welcome_message do
    write(@prompts.welcome_to_game)
  end

  def display_board do
    write(@prompts.heres_the_board(@presenter.display_sample_board))
  end

  def get_first_or_second do
    first_or_second = rstrip(gets(@prompts.first_or_second))
    if first_or_second == "first" || first_or_second == "second" do
      first_or_second
    else
      get_first_or_second
    end
  end

  def get_opponent do
    opponent = rstrip(gets(@prompts.opponent))
    if opponent == "smart" || opponent == "dumb" do
      opponent
    else
      get_opponent
    end
  end

  def ask_if_user_wants_to_play_again do
    rstrip(gets(@prompts.play_again?))
  end

  def say_goodbye do
    write(@prompts.bye)
  end

  def display_current_board(updated_board) do
    write("\nCurrent Board:\n#{@presenter.display(updated_board)}")
  end

  def display_game_over_message(updated_board_state) do
    write("\nCurrent Board:\n#{@presenter.display(updated_board_state)}\n#{create_game_over_message(updated_board_state)}")
  end

  def create_game_over_message(current_board) do
    result = @rules.who_wins?(current_board)
    cond do
      result == "O" ->
        "Game over! The computer won!\n"
      result == "X" ->
        "Game over! You won!\n"
      result == "tie" ->
        "Game over! It's a tie!\n"
    end
  end

  def computer_playing_message(player) do
    player = replace(to_string(player.type), "_", " ")
    if String.match?(player, ~r/computer/) do
      write("\nThe #{player} is playing...\n")
    end
  end
end
