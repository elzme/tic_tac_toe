defmodule Game do
  import List, only: [first: 1]
  import Enum, only: [reverse: 1]
  @io CommandLineIO
  @rules Rules
  @setup Setup

  def new_game(board) do
    current_board = board.generate_blank_board(9)
    players = @setup.setup_new_game
    game_loop(board, current_board, players)
  end

  def game_loop(board, current_board, players) do
    current_player = first(players)
    #the_computer_is_playing(current_player)
    position = current_player.get_move(current_board)
    updated_board = board.update(current_board, position, current_player.mark)
    @io.display_current_board(updated_board)
    if @rules.game_over?(updated_board) do
      @io.display_game_over_message(updated_board)
      play_again?(board)
    else
      game_loop(board, updated_board, reverse(players))
    end
  end

  def the_computer_is_playing(current_player) do
    if current_player.type == :dumb || current_player.type == :smart do
      @io.computer_playing_message
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
