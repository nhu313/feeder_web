defmodule FeedRetriever do
  def feeds do
    pmap(Feeder.Feed.Queries.all, &retrieve_content(&1))
      |> Enum.concat
  end

  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) -> spawn_link fn -> (send me, { self, fun.(elem) }) end end)
    |> Enum.map(fn (pid) -> receive do { ^pid, result } -> result end end)
  end

  def retrieve_content(feed) do
    HTTPotion.start
    response = HTTPotion.get feed.url
    RssParser.parse(response.body, feed.type)
      |> Enum.map(&strip_html_tags(&1))
      |> Enum.map(&shorten_body(&1))
  end

  def shorten_body(item) do
    %{item | body: String.slice(item.body, 0, 400)}
  end

  def strip_html_tags(node) do
    %{node | body: String.replace(node.body, ~r/<[^>]*>/, "")}
  end
end
