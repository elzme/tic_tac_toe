defmodule TicTacToe do
  def main() do
    Game.new_game(TicTacToeBoard, Player)
  end

  def play do
    main
  end
end

