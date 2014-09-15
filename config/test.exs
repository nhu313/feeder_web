use Mix.Config

config :phoenix, FeederWeb.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_feeder_web_key",
  session_secret: "1$F7C@^K1$E$U07HYYNIS^%F#83S+5MW!&Q_*EQ&$_(!%#^$(XJQL)&5H+BXJD0C1V%L3O*N"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


