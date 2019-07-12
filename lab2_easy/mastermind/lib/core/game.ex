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
    (1..6)
    |> Enum.shuffle
    |> Enum.take(4)
  end
  
  defp random_answer(answer) do
    answer
  end
  
  def move(game, guess) do
    %__MODULE__{game| guesses: [guess|game.guesses]}
  end
  
  def won?(%{ guesses: []}) do
    false
  end
  def won?(game) do
    guess = List.first(game.guesses)
    
    # determine if guess is a winner
    false
  end
  
  def finished?(game) do
    # return true if game is won or if user has guessed ten times
  end
  
  def board(game) do
    game.guesses
    |> Enum.reverse
    |> Enum.map( fn(guess) -> row(game, guess) end )
  end
  
  defp row(game, guess) do
    [guess, Score.new(game.answer, guess)]
  end
  
  def state(game) do
    # this function needs to correctly return the finished state
    
    %{
      board: board(game), 
      finished: false,  
      won: false
    }
  end
end