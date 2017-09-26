use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :healthlocker, Healthlocker.Endpoint,
  server: true, # see: https://stackoverflow.com/a/44855391/1148249
  root: ".",
  version: Mix.Project.config[:version],
  http: [port: 4000],
  debug_errors: false,
  url: [host: "localhost"],
  # http: [port: System.get_env("PORT")],
  # url: [scheme: "http", host: System.get_env("HEROKU_URL")], # port: 443],
  # force_ssl: [rewrite_on: [:x_forwarded_proto]],
  # cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :healthlocker, Healthlocker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "healthlocker_dev",
  hostname: "localhost",
  pool_size: 10

config :healthlocker, Healthlocker.ReadOnlyRepo,
  adapter: MssqlEcto,
  hostname: System.get_env("READ_ONLY_HOSTNAME"),
  username: System.get_env("READ_ONLY_USERNAME"),
  password: System.get_env("READ_ONLY_PASSWORD"),
  database: System.get_env("READ_ONLY_DATABASE"),
  idle_timeout: String.to_integer(System.get_env("TIMEOUT_INTERVAL"))

# Do not print debug messages in production
config :logger,
  backends: [{LoggerFileBackend, :error_log}]

config :logger, :error_log,
  path: "/var/log/healthlocker/error.log",
  level: :error

config :healthlocker, :analytics, Healthlocker.Analytics.Segment

config :healthlocker, :environment, :prod

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :healthlocker, Healthlocker.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :healthlocker, Healthlocker.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :healthlocker, Healthlocker.Endpoint, server: true
#
# import_config "prod.secret.exs"
