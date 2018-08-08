defmodule EventBusExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :event_bus_example,
      version: "0.1.0",
      elixir: "~> 1.7-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EventBusExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:event_bus, "~> 1.3"},
      {:gen_stage, "~> 0.14"}
    ]
  end
end
