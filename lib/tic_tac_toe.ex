defmodule TicTacToe do
  def main(args \\ []) do
    Game.new_game(TicTacToeBoard)
  end

  def play do
    main
  end
end

