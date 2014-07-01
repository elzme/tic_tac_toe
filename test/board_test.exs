defmodule BoardTest do
  use ExUnit.Case

  test "it returns a blank board map" do
    assert Board.generate_blank_board ==
    %{ 1 => "", 2 => "", 3 => "",
       4 => "", 5 => "", 6 => "",
       7 => "", 8 => "", 9 => ""}
  end

end
