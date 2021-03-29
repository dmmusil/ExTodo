# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo,
  ecto_repos: [Todo.Repo],
  event_stores: [Todo.EventStore]

config :todo, Todo.App,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Todo.EventStore
  ],
  pub_sub: :local,
  registry: :local

# Configures the endpoint
config :todo, TodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "MI3463dSKiVUjmwjbiyCM11rRdqOKzpV4p9EqCOCLM4Qmp/Q+jN/97v735PUylGe",
  render_errors: [
    view: TodoWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: Todo.PubSub,
  live_view: [signing_salt: "k+Tin04C"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: Todo.Repo

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
