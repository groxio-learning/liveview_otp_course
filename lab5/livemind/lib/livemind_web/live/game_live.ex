defmodule LivemindWeb.GameLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>Welcome to Livemind, <%= @hello %></h1>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, :hello, :world)}
  end

  # def handle_event("inc", _, socket) do
  #   {:noreply, update(socket, :val, &(&1 + 1))}
  # end

end
