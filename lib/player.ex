defmodule Player do
  import String

  defstruct type: :human, mark: "X"

  def get_move(player, current_board) do
    cond do
      player.type == :human ->
        get_human_player_move(player, current_board)
      player.type == :smart_computer ->
        get_unbeatable_computer_player_move(current_board, player.mark)
      player.type == :dumb_computer ->
         get_easy_computer_player_move(current_board)
    end
  end

  defp get_easy_computer_player_move(current_board) do
    position = :crypto.rand_uniform(0,8)
    if Rules.valid_move?(current_board, position) do
      position
    else
      get_easy_computer_player_move(current_board)
    end
  end

  def get_unbeatable_computer_player_move(current_board, computer_mark) do
    get_best_move(current_board, computer_mark)
  end

  defp get_human_player_move(player, current_board) do
    position = rstrip(CommandLineIO.gets "Please enter your move (1 - 9):\n")
    if Rules.valid_move?(current_board, position) do
      to_integer(position)
    else
      get_human_player_move(player, current_board)
    end
  end

  def get_score(current_board, player_mark) do
    winner = Rules.who_wins?(current_board)
    cond do
      winner == player_mark ->
        100
      (winner != player_mark && Rules.winner_on_board?(current_board)) ->
       -100
      true ->
        0
    end
  end

  def switch_player_mark(current_player_mark) do
    if current_player_mark == "X" do
      "O"
    else
      "X"
    end
  end

  def score_move(current_board, player_mark, move, depth) do
    updated_board = Board.update(current_board, move, player_mark)
    updated_depth = depth + 1
    if Rules.game_over?(updated_board) do
      score_divided_by_depth = div(get_score(updated_board, player_mark), updated_depth)
      [score_divided_by_depth, move]
    else
      #[score, depth, move]
       [(-1 * (List.first(negamax(updated_board, switch_player_mark(player_mark), updated_depth)))), updated_depth, move]
    end
  end

  def negamax(current_board, player_mark, depth) do
    moves = Board.get_blank_spaces(current_board)
    Enum.map(moves, fn(x) -> score_move(current_board, player_mark, x, depth) end)
    |>Enum.max()
  end

  def get_best_move(current_board, computer_mark) do
    List.last(negamax(current_board, "O", 0))
  end
end
