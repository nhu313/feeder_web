defmodule SorterTest do
  use ExUnit.Case

  test "sorts entries when there are two feeds" do
    [%{body: "<p>A developer joining a project, follow.</p>",
             date: "2014-07-11T00:00:00-07:00",
             link: "http://8thlight.github.com/ginny-hendry/2014/07/11/take-pride-in-your-legacy-code.html",
             title: "Take Pride in Your Legacy (Code)"},
    %{body: "<p>What do architects (designers of buildings), software developers, and thieves have in common?  let me know.</p>",
             date: "2014-07-09T00:00:00-07:00",
             link: "http://8thlight.github.com/craig-demyanovich/2014/07/09/pattern-language-of-thieves.html",
             title: "Pattern Language of Thieves"}]


  end
end
