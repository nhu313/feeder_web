defmodule Feeder.Repo do
    use Ecto.Repo, adapter: Ecto.Adapters.Postgres

    def conf do
      parse_url "ecto://postgres:postgres@localhost/feeder"
    end

    def priv do
      app_dir(:feeder_web, "priv/repo")
    end
end
