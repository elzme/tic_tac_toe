defmodule TicTacToe do
  def main(args \\ []) do
    Game.new_game(TicTacToeBoard, Player)
  end

  def play do
    main()
  end
end

