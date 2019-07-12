defmodule Mastermind.Core.Score do
  defstruct [:reds, :whites]
  
  def new(answer, guess) do
    %__MODULE__{ 
    }
  end
  
  def winner?(score) do
  end
  
  def white_count(answer, guess) do
    # answer_size - misses - reds
  end
    
  def miss_count(answer, guess) do
    (answer -- guess)
    |> length
  end
  
  def red_count(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.filter(&same/1)
    |> length
  end 
  
  defp same({x, y}) do
  end
end