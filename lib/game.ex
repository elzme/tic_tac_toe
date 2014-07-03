defmodule Game do
  import String, only: [rstrip: 1]

  def new_game do
    Setup.setup_game
    first_or_second? = Setup.get_first_or_second #this will return either 'first' or 'second'
    opponent = Setup.choose_opponent #this will return either 'smart' or 'dumb'
    players = Setup.create_players(opponent) #this will return a list with both players
    set_first_player(players, first_or_second?) #this reverses the list if the user wants to go second
    game_loop(Board.generate_blank_board, players)
  end

  def game_loop(current_board, players) do
    CommandLineIO.write("\nCurrent Board:\n#{Board.display(current_board)}")
    current_player = List.first(players)
    position = Player.get_move(current_player, current_board)
    updated_board = Board.update(current_board, position, current_player.mark)
    if Rules.game_over?(updated_board) do
      CommandLineIO.write("\nCurrent Board:\n#{Board.display(updated_board)}\n#{create_game_over_message(updated_board)}")
      play_again?
    else
      game_loop(updated_board, Enum.reverse(players))
    end
  end

  def set_first_player(first_or_second, players) do
    if first_or_second == "second" do
       Enum.reverse(players)
    else
      players
    end
  end

  def switch_player(current_player) do
    if current_player == %Player{} do
      %Player{type: :computer, mark: "O"}
    else
      %Player{}
    end
  end

  def create_game_over_message(current_board) do
    result = Rules.who_wins?(current_board)
    cond do
      result == "O" ->
        "Game over! The computer won!\n"
      result == "X" ->
        "Game over! You won!\n"
      result == "tie" ->
        "Game over! It's a tie!\n"
    end
  end

  def play_again? do
    if rstrip(CommandLineIO.gets("Would you like to play again?\n")) == "yes" do
      new_game
    else
      CommandLineIO.write("Bye!\n")
    end

  end
end
