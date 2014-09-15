defmodule Feeder.Feed.Queries do
  import Ecto.Query

  def all do
    Feeder.Repo.all Feeder.Feed
  end

  def save(item) do
    Feeder.Repo.insert item
  end
end
