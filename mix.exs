defmodule Token.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :token,
      deps: deps(),
      description: "Functions for generating and hashing strings",
      elixir: "~> 1.0",
      package: package(),
      version: "0.1.1"
    ]
  end

  defp deps() do
    [
      {:ex_doc, "~> 0.17.1", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/hivereactor/token"
      },
      maintainers: ["Adrián Daraš"]
    ]
  end
end
