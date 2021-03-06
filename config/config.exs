# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, FeederWeb.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_feeder_web_key",
  session_secret: "1$F7C@^K1$E$U07HYYNIS^%F#83S+5MW!&Q_*EQ&$_(!%#^$(XJQL)&5H+BXJD0C1V%L3O*N",
  catch_errors: true,
  debug_errors: false,
  error_controller: FeederWeb.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
