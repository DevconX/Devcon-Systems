use Mix.Config

# Configure your database
config :academia, Academia.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "docker",
  database: "academia_dev",
  hostname: "localhost",
  pool_size: 10

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "cb18fecde63648f2c979",
  client_secret: "2dcd795b9223dfc6404369feea66be8424c16d08"
