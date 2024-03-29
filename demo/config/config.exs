# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :demo,
  namespace: Demo.Firestore,
  ecto_repos: [Demo.Firestore.Repo]

# Configures the endpoint
config :demo, Demo.FirestoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "US0BJh3sG00jHwrTx66NJq2s1brwvss/BSw5qXXAMnNo9Mz0239T0l8yQL/1ehyV",
  render_errors: [view: Demo.FirestoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Demo.Firestore.PubSub,
  live_view: [signing_salt: "ze3apauB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
