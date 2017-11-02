# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spot,
  ecto_repos: [Spot.Repo]

# Configures the endpoint
config :spot, SpotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fLOPTCjLpBQgPlyfl5IrMCFyJDZmEYRltL0UkuiTwU7U9t4vnDM6+WgwTQnqRlfb",
  render_errors: [view: SpotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Spot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "spotify.exs"
import_config "secret.exs"
