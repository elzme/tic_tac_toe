defmodule ComputerPlayer do
  import String, only: [rstrip: 1, to_integer: 1, to_atom: 1]
  @human_player HumanPlayer
  @unbeatable_computer_player UnbeatableComputerPlayer
  @easy_computer_player EasyComputerPlayer

  defstruct type: :smart, mark: "O"

  def get_player_info(player_type) do
    %ComputerPlayer{type: to_atom(player_type), mark: "O"}
  end

  def get_move(player, current_board) do
    cond do
      player.type == :smart ->
        @unbeatable_computer_player.get_move(current_board, player.mark)
      player.type == :dumb ->
        @easy_computer_player.get_move(current_board)
    end
  end

  def dumb_move(current_board) do
    position = :crypto.rand_uniform(0,8)
    if @rules.valid_move?(current_board, position) do
      position
    else
      dumb_move(current_board)
    end
  end

  def smart_move(current_board, computer_mark) do
    @computer_strategy.get_best_move(current_board, computer_mark)
  end
end
