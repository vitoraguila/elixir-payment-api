# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :paymentsApi,
  ecto_repos: [PaymentsApi.Repo]

# Configures the endpoint
config :paymentsApi, PaymentsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "81CgxZRlrah0v1WhWXvOTahdTsB0VpgQQL93B9X6dHCzq2yaiuUR2CDvPxmo3wbA",
  render_errors: [view: PaymentsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PaymentsApi.PubSub,
  live_view: [signing_salt: "L9eqAblA"]

config :paymentsApi, PaymentsApi.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
