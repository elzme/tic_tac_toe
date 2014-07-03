defmodule Negamax do

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
