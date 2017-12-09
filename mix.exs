defmodule Advent2017.Mixfile do
  use Mix.Project

  def project do
    [
      app: :advent2017,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:math, "~> 0.3.0"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
