defmodule GameServerTest do
  alias Mastermind.Boundary.GameServer
  use ExUnit.Case
  
  @tag :skip
  # internal direct GenServer calls
  test "processes init" do
    game = new_game()
    
    assert GameServer.init(game) == {:ok, game}
  end

  @tag :skip
  test "handles start link" do
    game = start_game()
    
    assert Process.alive?(game)
  end

  @tag :skip
  test "makes a move with handle_call without crashing" do
    game = start_game()
    
    GenServer.call(game, {:move, [1, 2, 3, 4]})
    assert Process.alive?(game)
  end
  
  @tag :skip
  test "checks state after creating a game and making a move" do
    game = start_game()
    
    GenServer.call(game, {:move, [1, 2, 3, 4]})
    state = GenServer.call(game, :state)

    assert Process.alive?(game)
    assert state.won
  end
  
  @tag :skip
  test "make a move through public API without crashing" do
    game = start_game()
    
    GameServer.move(game, [1, 2, 3, 4])
    assert Process.alive?(game)
  end

  @tag :skip
  test "make a move and return state through public API, winner" do
    game = start_game()
    
    GameServer.move(game, [1, 2, 3, 4])
    state = GameServer.state(game)

    assert state.won
  end
  
  @tag :skip
  test "make a move and return state through public API, not winner" do
    game = start_game()
    
    GameServer.move(game, [1, 2, 3, 5])
    state = GameServer.state(game)

    refute state.won
  end
  
  
  def new_game() do
    game = Mastermind.Core.Game.new([1, 2, 3, 4])
  end
  
  def start_game() do
    {:ok, game} = GameServer.start_link([1, 2, 3, 4])
    game
  end
end
