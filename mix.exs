defmodule Facsimilie.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :facsimilie,
      version: @version,
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      name: "Facsimilie",
      source_url: "https://github.com/mithereal/facsimilie",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Facsimilie.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    """
    Sync 2 or more mail servers.
    """
  end

  defp package() do
    [maintainers: ["Jason Clark"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mithereal/facsimilie"}]
  end

  defp aliases do
    [c: "compile"]
  end
end
