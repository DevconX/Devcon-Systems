use Mix.Config

# Configure your database
config :academia, Academia.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "academia_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
