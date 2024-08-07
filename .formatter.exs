[
  import_deps: [:ecto, :ecto_sql, :phoenix, :phoenix_live_view],
  subdirectories: ["priv/*/migrations"],
  inputs: ["{mix, .formatter}.exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"],
  locals_without_parens: [
    router: 1
  ]
]
