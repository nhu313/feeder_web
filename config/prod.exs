use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, FeederWeb.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_feeder_web_key",
  session_secret: "1$F7C@^K1$E$U07HYYNIS^%F#83S+5MW!&Q_*EQ&$_(!%#^$(XJQL)&5H+BXJD0C1V%L3O*N"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

