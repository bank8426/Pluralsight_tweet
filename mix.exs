defmodule PluralsightTweet.MixProject do
  use Mix.Project

  def project do
    [
      app: :pluralsight_tweet,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :quantum,
      :extwitter],
      mod: {PluralsightTweet.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~>0.4.11"},
      {:quantum, "~> 1.8.0"},
      {:extwitter, "~> 0.9.4"},
      {:mock, "~> 0.3.3"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
