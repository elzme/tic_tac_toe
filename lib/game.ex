defmodule Game do
  import String, only: [rstrip: 1]
  import List, only: [first: 1]
  import Enum, only: [reverse: 1]
  @io CommandLineIO
  @rules Rules
  @setup Setup

  def new_game(board) do
    new_board_state = board.generate_blank_board
    players = @setup.setup_new_game
    game_loop(new_board_state, players, board)
  end

  def game_loop(current_board, players, board) do
    current_player = first(players)
    the_computer_is_playing(current_player)
    position = current_player.get_move(current_player, current_board)
    updated_board = board.update(current_board, position, current_player.mark)
    @io.display_current_board
    if @rules.game_over?(updated_board) do
      @io.write("\nCurrent Board:\n#{board.display(updated_board)}\n#{create_game_over_message(updated_board)}")
      play_again?(board)
    else
      game_loop(updated_board, reverse(players), board)
    end
  end

  def the_computer_is_playing(current_player) do
    if current_player.type == :dumb_computer || current_player.type == :smart_computer do
      @io.write("\nThe computer is playing...\n")
    end
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

  def play_again?(board) do
    if @io.ask_if_user_wants_to_play_again == "yes" do
      new_game(board)
    else
      @io.say_goodbye
    end
  end
end
