defmodule Livemind.Repo do
  use Ecto.Repo,
    otp_app: :livemind,
    adapter: Ecto.Adapters.Postgres
end
