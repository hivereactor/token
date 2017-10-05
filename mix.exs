defmodule Token.Mixfile do
  use Mix.Project

  def project do
    [
      app: :token,
      deps: deps(),
      elixir: "~> 1.0",
      version: "0.1.0"
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.17.1", only: :dev, runtime: false}
    ]
  end
end
