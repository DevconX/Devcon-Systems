use Mix.Config

config :academia, ecto_repos: [Academia.Repo]

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

import_config "#{Mix.env}.exs"
