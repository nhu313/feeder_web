defmodule FeederWeb.Mixfile do
  use Mix.Project

  def project do
    [ app: :feeder_web,
      version: "0.0.1",
      elixir: "~> 1.0.0",
      elixirc_paths: ["lib", "web"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { FeederWeb, [] },
      applications: [:phoenix, :cowboy, :logger, :postgrex, :ecto, :timex]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:phoenix, "0.4.0"},
      {:cowboy, "~> 1.0.0"},
      {:postgrex, "0.6.0"},
      {:ecto, "0.2.4"},
      {:httpotion, github: "myfreeweb/httpotion" },
      {:quinn, "0.0.2"},
      {:timex, "0.12.8"}
    ]
  end
end
