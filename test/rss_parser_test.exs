defmodule RssParserTest do
  use ExUnit.Case
  use Timex

  @pacific_timezone Date.timezone("GMT+5")

  test "finds entries in atom" do
    expected = [%{body: "<p>A developer joining a project, follow.</p>",
                         date: Date.from({{2014,7,11},{1,0,5}}),
                         link: "http://8thlight.github.com/ginny-hendry/2014/07/11/take-pride-in-your-legacy-code.html",
                         title: "Take Pride in Your Legacy (Code)"},
                %{body: "<p>What do architects (designers of buildings), software developers, and thieves have in common?  let me know.</p>",
                         date: Date.from({{2014,7,9},{1,0,12}}),
                         link: "http://8thlight.github.com/craig-demyanovich/2014/07/09/pattern-language-of-thieves.html",
                         title: "Pattern Language of Thieves"}]

    entries = File.read!("test/fixture/atom_small.xml")
              |> RssParser.parse "atom"
    assert entries == expected
  end

  test "find entries in rss" do
    expected = [%{body: "I really wanted this Lego set.",
                         date: Date.from({{2014,6,24},{8,1,54}}),
                         link: "http://wongfuphil.wordpress.com/2014/06/24/my-end-of-the-deal/",
                         title: "My end of the deal"},
                %{body: "<p><a href=\"http://wongfuphil.files.wordpress.com/2014/05/mom2.jpg\"><img class=\"alignnone size-full wp-image-162\" src=\"http://wongfuphil.files.wordpress.com/2014/05/mom2.jpg?w=800\" alt=\"mom\"/></a></p><p>My mom is a very simple woman.</p>",
                         date: Date.from({{2014,5,11},{22,53,48}}),
                         link: "http://wongfuphil.wordpress.com/2014/05/11/back-to-you/",
                         title: "Back to You"}]

    entries = File.read!("test/fixture/rss_small.xml")
              |> RssParser.parse "rss"
    assert entries == expected
  end

  test "find entries in a real rss" do
    [head | _] = File.read!("test/fixture/rss.xml")
                  |> RssParser.parse "rss"
    assert head.title == "My end of the deal"
  end


  test "find entries in a real atom" do
    [head | _] = File.read!("test/fixture/atom.xml")
                  |> RssParser.parse "atom"
    assert head.title == "Take Pride in Your Legacy (Code)"
  end
end
