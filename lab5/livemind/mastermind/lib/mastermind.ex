defmodule Mastermind do
  alias Mastermind.Boundary.GameServer
  
  def new(answer \\ nil) do
    GameServer.start_link(answer)
  end
  
  def state(game) do
    GameServer.state(game)
  end
  
  def move(game, guess) do
    GameServer.move(game, guess)
  end
end
