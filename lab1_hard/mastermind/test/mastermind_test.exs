defmodule MastermindTest do
  use ExUnit.Case
  doctest Mastermind

  test "placeholder" do
    assert Mastermind.hello() == :world
  end
end
