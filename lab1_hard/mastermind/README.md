# Mastermind

Mastermind is a game between two people or a person and a computer. One person places a code of four different colors and one person has ten tries to guess the code. We'll use numbers from 1-6 instead of colors. 

# Lab Flow

1. Clone the lab at https://github.com/groxio-learning/mastermind_one_day/

  cd your/directory/name/lab1
  git clone https://github.com/groxio-learning/mastermind_one_day/tree/master/lab1/mastermind

2. cd mastermind
3. run mix deps.get
4. run mix test

Your job is to make all of the tests pass in test/game_test.exs. One by one, move the @tag :skip tags from each test. Run the tests, and make the changes in the code to make the test pass. 

Your tests will guide you toward opening up the file in `lib/core/game.ex` and add a struct to it. 


# Mastermind Lab 1

In this lab, we're going to build a version of the [Master Mind](http://www.webgamesonline.com/mastermind/) game. Here are the rules: 

- Each board has a hidden answer and a list of guesses
- The answer will have a list of 4 pegs, all different numbers from 1-6
- A player gets 10 turns
- On each turn, a player guesses what the secret code is
- After each turn, the computer "scores" each guess
- The computer scores 1 red peg for each correct number in the correct position
- The computer scores 1 white peg for each correct peg in the wrong position
- The player wins when they guess all pegs correctly
- The computer wins if the player guesses 10 times without a correct answer

# Your Universe

This is what you need to know about Elixir to finish this lab. 

## Running Tests

In Elixir, you want to be in the root directory of your project. For us, that's `mastermind`. These are the important files: 

- Your program goes in `mastermind/lib`
- Your tests go in `mastermind/test`

To compile and run tests, run 

```
mix test
```

To run an interactive Elixir console, run 

```
iex
```

Type control-c twice to exit. (Windows will depend on how you installed.)

To run your program in the console, run 

```
iex -S mix
```



## Maps and Structs

An *atom* is the name of a concept, like a constant. 

A *map* is a data structure that has keys and values. You'll specify a map like this: 

```Elixir
%{ :name => "Bruce", :age => 53 }
```

The `%{}` is the delimiter for a map. The `:name` is an atom (like a symbol in Ruby or a user-defined class name in Java). If the first element of a map is an atom, you can use a convenient shorthand, like this: 

```Elixir
%{ name: "Bruce" }
```

A *struct* is a map that only allows specific keys. To define a struct, first define a module and then define your struct within it. The struct will take on the name of your module. 

For example, to define a struct named `person` that allows `name` and `age` keys, do this: 

```Elixir
defmodule Person do
  defstruct [:name, :age]
end
```

Then you can use the struct like this: 

```Elixir
%Person{ name: "Bruce", age: 53 }
```

Note that `%{ key: value }` is shorthand for `%{ :key => value }`. 



Learn more about structs  at https://elixir-lang.org/getting-started/structs.html . 
