defmodule ExMink.InformationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExMink.Information` context.
  """

  @doc """
  Generate a about.
  """
  def about_fixture() do
    %{
      name: Atom.to_string(Mix.Project.config()[:app]),
      version: Mix.Project.config()[:version],
      elixir_version: System.version(),
      status: "online"
    }
  end
end
