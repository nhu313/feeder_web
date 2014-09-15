defmodule Feeder.Feed do
  use Ecto.Model

  schema "feeds" do
    field :url, :string
    field :type, :string, default: "rss"
  end
end

