defmodule Player do
  def get_move do
    CommandLineIO.gets "Please enter your move (1 - 9):\n"
  end
end
