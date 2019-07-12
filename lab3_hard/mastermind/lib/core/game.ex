defmodule Mastermind.Core.Game do
  alias Mastermind.Core.Score
  defstruct(
    guesses: [], 
    answer: [1, 2, 3, 4]
  )
  
  def new(answer \\ nil) do
    %__MODULE__{
      answer: random_answer(answer)
    }
  end
  
  defp random_answer(nil) do
  end
  defp random_answer(answer) do
  end
  
  def move(game, guess) do
  end
  
  def won?(%{ guesses: []}) do
  end
  def won?(game) do
  end
  
  def finished?(game) do
  end
  
  def board(game) do
  end
  
  defp row(game, guess) do
  end
  
  def state(game) do
  end
end