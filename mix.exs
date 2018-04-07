defmodule GildedRose.Mixfile do
  use Mix.Project

  def project do
    [app: :gilded_rose,
     version: "0.0.1",
     elixir: "~> 1.4",
     deps: deps()]
  end

  defp deps do
    [
      {:ex_parameterized, "~> 1.3.1"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
