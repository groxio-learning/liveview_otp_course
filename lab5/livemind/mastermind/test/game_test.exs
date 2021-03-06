defmodule GameTest do
  use ExUnit.Case
  alias Mastermind.Core.Game
  alias Mastermind.Core.Score
  
  
  # lab 1
  test "Game should have a struct" do
    assert %Game{}.__struct__ == Game
  end
  
  test "Game should have sensible defaults" do
    assert %Game{}.guesses == []
    assert %Game{}.answer == [1, 2, 3, 4]
  end

  test "Score should have a struct" do
    assert %Score{}.__struct__ == Score
  end
  
  test "Score should have reds and whites attributes" do
    assert :reds   in Map.keys( %Score{} )
    assert :whites in Map.keys( %Score{} )
  end
  
  # lab 2
  
  test "Count the right pegs in the right slots" do
    
    # 1 and 2 are in the same position in both lists... etc
    assert Score.red_count([1, 2, 3, 4], [1, 2, 5, 6]) == 2

    # No pegs overlap
    assert Score.red_count([0, 0, 0, 0], [1, 1, 1, 1]) == 0

    # all pegs are in the right position
    assert Score.red_count([1, 2, 3, 4], [1, 2, 3, 4]) == 4
    
    # No pegs are in the right position, even though they are the right pegs
    assert Score.red_count([4, 3, 2, 1], [1, 2, 3, 4]) == 0
  end

  test "Count wrong pegs in the wrong slots as miss" do
    # misses are not used in the game, but they help calculate white count
    
    # 5 and 6 are complete misses
    assert Score.miss_count([1, 2, 3, 4], [1, 2, 5, 6]) == 2

    # all are misses
    assert Score.miss_count([0, 0, 0, 0], [1, 1, 1, 1]) == 4
    
    # 1 2 3 4 are the right pegs in the right slots
    assert Score.miss_count([1, 2, 3, 4], [1, 2, 3, 4]) == 0

    # 1 2 3 4 are the right pegs in the wrong slots, so not misses
    assert Score.miss_count([4, 3, 2, 1], [1, 2, 3, 4]) == 0
  end
  
  test "should count whites" do
    # whites are the right pegs in the wrong slots
    
    # 5 and 6 are complete misses; 1 and 2 are reds so none are whites. 
    assert Score.white_count([1, 2, 3, 4], [1, 2, 5, 6]) == 0

    # none are the right pegs
    assert Score.white_count([0, 0, 0, 0], [1, 1, 1, 1]) == 0
    
    # 1 2 3 4 are the right pegs in the right slots; none are whites.  
    assert Score.white_count([1, 2, 3, 4], [1, 2, 3, 4]) == 0

    # 1 2 3 4 are the right pegs in the wrong slots, so all are whites
    assert Score.white_count([4, 3, 2, 1], [1, 2, 3, 4]) == 4

    # 1 2  are the right pegs in the wrong slots, so are whites
    assert Score.white_count([4, 3, 2, 1], [1, 2, 6, 6]) == 2
    
  end
  
  test "should roll up red and white counts" do
    score = 
      [1, 2, 3, 4]
      |> Score.new([1, 2, 4, 6])
      
    assert score.whites == 1
    assert score.reds == 2
  end
  
  test "should compute a winner" do
    assert (Score.new([1, 2, 3, 4], [1, 2, 3, 4]) |> Score.winner?)
    refute (Score.new([6, 2, 3, 4], [1, 2, 3, 4]) |> Score.winner?)
  end
  
  # lab3
  test "if the last game is a winner the game is a winner" do
    assert Game.won?(four_move_winner())
    refute Game.won?(four_move_nonwinner())
  end
  
  test "won games are finished" do
    assert Game.finished?(four_move_winner())
    refute Game.finished?(four_move_nonwinner())
  end
  
  test "games are finished after 10 moves" do
    assert Game.finished?(ten_move_loser())
  end
  
  test "should return board with guess and score for each row" do
    board = 
      two_move_winner()
      |> Game.board

    expected = 
      [
        [[1, 2, 3, 3], %Score{reds: 3, whites: 0}], 
        [[1, 2, 3, 4], %Score{reds: 4, whites: 0}]
      ]
        
    assert board == expected
  end
  
  test "should return state with board, finished and won" do
    %{board: board, won: won, finished: finished} = 
      two_move_winner()
      |> Game.state

    expected = 
      [
        [[1, 2, 3, 3], %Score{reds: 3, whites: 0}], 
        [[1, 2, 3, 4], %Score{reds: 4, whites: 0}]
      ]
        
    assert board == expected
    assert finished
    assert won
  end
  
  

  def two_move_winner() do
    [1, 2, 3, 4]
    |> Game.new
    |> Game.move([1, 2, 3, 3])
    |> Game.move([1, 2, 3, 4])
  end

  def four_move_winner() do
    [1, 2, 3, 4]
    |> Game.new
    |> Game.move([1, 2, 3, 1])
    |> Game.move([1, 2, 3, 2])
    |> Game.move([1, 2, 3, 3])
    |> Game.move([1, 2, 3, 4])
  end
  
  def four_move_nonwinner() do
    [1, 2, 3, 4]
    |> Game.new
    |> Game.move([1, 2, 3, 1])
    |> Game.move([1, 2, 3, 2])
    |> Game.move([1, 2, 3, 3])
    |> Game.move([1, 2, 3, 5])
  end
  
  def ten_move_loser() do
    [1, 2, 3, 4]
    |> Game.new
    |> Game.move([1, 2, 3, 1])
    |> Game.move([1, 2, 3, 2])
    |> Game.move([1, 2, 3, 3])
    |> Game.move([1, 2, 3, 5])
    |> Game.move([1, 2, 3, 6])
    |> Game.move([1, 2, 1, 1])
    |> Game.move([1, 2, 2, 3])
    |> Game.move([1, 2, 4, 5])
    |> Game.move([1, 2, 5, 3])
    |> Game.move([1, 2, 6, 5])
  end

end
