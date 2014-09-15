defmodule FeederWeb do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [worker(Feeder.Repo, [])]
    opts = [strategy: :one_for_one, name: FeederWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
