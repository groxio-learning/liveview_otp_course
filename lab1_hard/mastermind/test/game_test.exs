defmodule GameTest do
  use ExUnit.Case
  alias Mastermind.Core.Game
  alias Mastermind.Core.Score
  
  @tag :skip 
  test "Game should have a struct" do
    assert %Game{}.__struct__ == Game
  end
  
  @tag :skip
  test "Game should have sensible defaults" do
    assert %Game{}.guesses == []
    assert %Game{}.answer == [1, 2, 3, 4]
  end

  @tag :skip 
  test "Score should have a struct" do
    assert %Score{}.__struct__ == Score
  end
  
  @tag :skip 
  test "Score should have reds and whites attributes" do
    assert :reds   in Map.keys( %Score{} )
    assert :whites in Map.keys( %Score{} )
  end

end
