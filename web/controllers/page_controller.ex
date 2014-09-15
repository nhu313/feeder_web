defmodule FeederWeb.PageController do
  use Phoenix.Controller

  def feeds(conn, _params) do
    feeds = Enum.map(Feeder.Feed.Queries.all, &retrieve_content(&1))
            |> Enum.concat

    IO.puts length(feeds)
    render conn, "feeds", feeds: feeds
  end

  def retrieve_content(feed) do
    HTTPotion.start
    response = HTTPotion.get feed.url
    RssParser.parse(response.body, feed.type)
      |> Enum.map(&strip_html_tags(&1))
      |> Enum.map(&shorten_body(&1))
  end

  def shorten_body(item) do
    %{item | body: String.slice(item.body, 0, 200)}
  end

  def strip_html_tags(node) do
    %{node | body: String.replace(node.body, ~r/<[^>]*>/, "")}
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
