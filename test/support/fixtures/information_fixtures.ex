defmodule ExMink.InformationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExMink.Information` context.
  """

  @doc """
  Generate a about.
  """
  def about_fixture(attrs \\ %{}) do
    %{
      name: "MYApp",
      version: 1,
      elixir_version: System.version(),
      status: "online"
    }
  end
end
