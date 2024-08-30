import Config
config :ash, disable_async?: true

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :blog_test, BlogTest.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "blog_test_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_test, BlogTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "eW1nzHli27bliZfKKZKlsDq1pGT3ZwNozUGCAmMWtcG7hkuPI+72wh8m30DSWHCG",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
