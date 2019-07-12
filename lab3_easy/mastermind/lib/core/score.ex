defmodule Mastermind.Core.Score do
  defstruct [:reds, :whites]
  
  def new(answer, guess) do
    %__MODULE__{ 
      reds: red_count(answer, guess), 
      whites: white_count(answer, guess)
    }
  end
  
  def winner?(score) do
    score.reds == 4
  end
  
  def white_count(answer, guess) do
    length(answer) - miss_count(answer, guess) - red_count(answer, guess)
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
    x == y
  end
end