# Mastermind

Mastermind is a game between two people or a person and a computer. One person places a code of four different colors and one person has ten tries to guess the code. We'll use numbers from 1-6 instead of colors. 

## Lab 4: OTP

In Lab 4, we will be saving state data using OTP. In the course, we'll do an introduction to describe how OTP works. Here are some things you need to know. 

- Think of a GenServer as a generic server. Elixir programmers use GenServers to control processes. 
- Our application will use GenServers to share common state for our game. 
- We'll look at an example application form the Elixir documentation. 

### First, include use GenServer to make the full API available.

```Elixir
defmodule Stack do
  use GenServer

```

Next, add an init function that uses one argument to set the initial state. 


```Elixir

  def init(stack) do
    {:ok, stack}
  end

```

Add a function to start the GenServer. 


```Elixir
  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end
```

Next, create some OTP functions that modify the state, or just return the state. You're just coding callbacks, or functions that Elixir will call when certain messages come into a process.  

In a `call`, you get the name of the message, the process it's coming from, and one argument for the state. You return a `:reply` tuple that returns the atom `:reply`, the response to the client, and the new state. It's asynchronous, meaning Elixir makes the call and the client waits on the result: 

```Elixir
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
```

In a `cast`, you get a message and the state. You can pass an argument as part of your message if you want, as in the `:push` message. The return is a `:no_reply` tuple which specifies the atom `:noreply` new state for the server, like this: 

```Elixir
  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
```

Next, you will write simple functions that allow your GenServer to be accessed with pure functions, like this: 

```Elixir
  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end
end
```

In this lab, we'll specify tests that walk you through each part of the implementation, but you can use this guide to tell you what the implementation should be. We'll implement a `start_link` that needs the `init` as above to start a MasterMind process, and we'll also two messages, a `call` to make a move, and a `call` to return the state. 


