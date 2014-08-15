defmodule Game do
  import List, only: [first: 1]
  import Enum, only: [reverse: 1]
  @io CommandLineIO
  @rules Rules
  @setup Setup

  def new_game(board) do
    current_board = board.generate_blank_board(9)
    players = @setup.setup_new_game
    current_player = first(players)
    game_loop(board, current_board, current_player, players)
  end

  def game_loop(board_module, current_board_state, current_player, players) do
    the_computer_is_playing(current_player)
    position = current_player.get_move(current_board_state)
    updated_board_state = board_module.update(current_board_state, position, current_player.mark)
    @io.display_current_board(updated_board_state)
    if @rules.game_over?(updated_board_state) do
      @io.display_game_over_message(updated_board_state)
      play_again?(board_module)
    else
      game_loop(board_module, updated_board_state, current_player, reverse(players))
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
