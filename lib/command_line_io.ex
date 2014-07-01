defmodule CommandLineIO do

  def display_output(msg) do
    IO.puts(msg)
  end

  def get_input(msg) do
    IO.gets(msg)
  end

end
