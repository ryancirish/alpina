[
  import_deps: [:ash_json_api, :ash_postgres, :ecto, :ecto_sql, :phoenix, :ash],
  subdirectories: ["priv/*/migrations"],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"]
]
