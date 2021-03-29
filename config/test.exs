use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :todo, Todo.Repo,
  username: "postgres",
  password: "changeme",
  database: "todo_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool_size: 1

config :todo, Todo.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "changeme",
  database: "eventstore_test",
  hostname: "localhost",
  pool_size: 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo, TodoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
# config :logger, level: :info
