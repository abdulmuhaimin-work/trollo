# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :trollo,
  ecto_repos: [Trollo.Repo]

# Configures the endpoint
config :trollo, Trollo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M6j47OQ1BA8m1Gn6dBM3qslASS5urdkHcEYW6if/jppik8zmRlRNwmUE2ollPZVz",
  render_errors: [view: Trollo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Trollo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Trollo",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "2drl7b0XQugdDOlmmi6r/gQCv03ipYopjKRWt7JGoxSAfh1MGqyu40srUfs4nVA1",
  serializer: Trollo.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
