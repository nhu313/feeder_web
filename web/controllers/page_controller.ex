defmodule FeederWeb.PageController do
  use Phoenix.Controller

  def feeds(conn, _params) do
    render conn, "feeds", feeds: FeedRetriever.feeds
  end

  def index(conn, _params) do
    render conn, "index", feeds: Feeder.Feed.Queries.all
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params) do
    feed = %Feeder.Feed{type: params["type"], url: params["url"]}
    Feeder.Repo.insert(feed)
    redirect conn, "/index"
  end

  def delete(conn, params) do
    Feeder.Repo.delete(%Feeder.Feed{id: String.to_integer(params["id"])})
    redirect conn, "/index"
  end
end
