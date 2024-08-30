# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :mime,
  extensions: %{"json" => "application/vnd.api+json"},
  types: %{"application/vnd.api+json" => ["json"]}

config :spark,
  formatter: [
    "Ash.Resource": [section_order: [:json_api, :postgres]],
    "Ash.Domain": [section_order: [:json_api]]
  ]

config :blog_test,
  ecto_repos: [BlogTest.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :blog_test, BlogTestWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: BlogTestWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BlogTest.PubSub,
  live_view: [signing_salt: "biJsqeoB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :esbuild,
  version: "0.17.11",
  blog_test: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
