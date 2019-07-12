defmodule Mastermind.Boundary.GameServer do
  use GenServer
  alias Mastermind.Core.Game
  
  # Client
      
    def start_link(answer) do
      GenServer.start_link __MODULE__, answer
    end
  
    def move(pid, guess) do
      GenServer.call pid, {:move, guess}
    end
  
    def state(pid) do
      GenServer.call pid, :state
    end
  
    # Server (callbacks)
  
    def init(answer) do
      {:ok, Game.new(answer) }
    end
  
    def handle_call({:move, guess}, _from, game) do
      new_game = Game.move(game, guess)
      
      {:reply, :ok, new_game}
    end
  
    def handle_call(:state, _from, game) do
      state = Game.state(game)
      
      {:reply, state, game}
    end
end