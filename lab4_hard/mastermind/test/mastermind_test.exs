defmodule MastermindTest do
  use ExUnit.Case

  @tag :skip
  test "creates a game" do
    game = new_game()
    assert Process.alive?(game)
  end

  @tag :skip
  test "makes a move" do
    game = new_game()
    
    Mastermind.move(game, [1, 2, 3, 4])
    state = Mastermind.state(game)
    
    assert state.finished
    assert state.won
  end
  
  def new_game() do
    {:ok, game} = Mastermind.new([1, 2, 3, 4])
    game
  end
end
