# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :livemind,
  ecto_repos: [Livemind.Repo]

# Configures the endpoint
config :livemind, LivemindWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OrjMiajChrwDCbcxC6Aede1ntZqmTl9EXbHlVQk34YNz3nkcYYAcerVHG+eo+r9O",
  render_errors: [view: LivemindWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Livemind.PubSub, adapter: Phoenix.PubSub.PG2], 
  live_view: [
    signing_salt: "Lgy2PP49/9vkl1ukZVanVeg03NATDN2M"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

