defmodule Mastermind.Core.Score do
  defstruct [:reds, :whites]
  
  def new(_answer, _guess) do
  end
  
  def winner?(_score) do
  end
  
  def white_count(_answer, _guess) do
  end
    
  def miss_count(_answer, _guess) do
  end
  
  def red_count(_answer, _guess) do
  end 
  
  # defp same({_x, _y}) do
  # end
end