defmodule LivemindWeb.Router do
  use LivemindWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LivemindWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/game", GameLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LivemindWeb do
  #   pipe_through :api
  # end
end
