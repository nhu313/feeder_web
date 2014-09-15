defmodule RssParser do

  def parse(xml, "rss") do
    parse(xml, &convert_rss(&1), :item)
  end

  def parse(xml, "atom") do
    parse(xml, &convert_atom(&1),:entry)
  end

  defp parse(xml, convert_func, item_name) do
    Quinn.parse(xml)
      |> Quinn.find(item_name)
      |> Enum.map(convert_func)
  end

  defp convert_rss(entry) do
    %{body: find_value(entry, :"description"),
             date: find_value(entry, :pubDate),
             link: find_value(entry, :link),
             title: find_value(entry, :title)}
  end

  defp convert_atom(entry) do
    %{body: find_value(entry, :content),
             date: find_value(entry, :updated),
             link: find_attr(entry, :link, :href),
             title: find_value(entry, :title)}
  end

  defp find_attr(entry, node_name, attr_name) do
    node = hd(Quinn.find([entry], [node_name]))
    node.attr[attr_name]
  end

  defp find_value(entry, node_name) do
    hd(hd(Quinn.find(entry, node_name)).value)
  end
end
