# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :reactExperiment, ReactExperimentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nzy/6wGTt3MkkBBG6tg21RuNDlyuylv9rO1Z/WZ4HkRw5kAOJX6KHUaXCMEewIqN",
  render_errors: [view: ReactExperimentWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReactExperiment.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
