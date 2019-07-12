defmodule LivemindWeb.PageController do
  use LivemindWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
