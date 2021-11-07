defmodule ExMink.AnimalsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExMink.Animals` context.
  """

  @doc """
  Generate a canine.
  """
  def canine_fixture(attrs \\ %{}) do
    {:ok, canine} =
      attrs
      |> Enum.into(%{
        average_weight_kg: 120.5,
        average_weight_pounds: 120.5,
        breed: "some breed",
        size_category: "some size_category",
        weight: "some weight"
      })
      |> ExMink.Animals.create_canine()

    canine
  end
end
