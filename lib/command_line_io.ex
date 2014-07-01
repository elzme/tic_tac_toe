defmodule CommandLineIO do

  def write(msg) do
    IO.write(msg)
  end

  def gets(msg) do
    IO.gets(msg)
  end
end
