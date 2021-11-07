defmodule ExMink.Animals do
  @moduledoc """
  The Animals context.
  """

  import Ecto.Query, warn: false
  alias ExMink.Repo

  alias ExMink.Animals.Canine

  @doc """
  Returns the list of canines.

  ## Examples

      iex> list_canines()
      [%Canine{}, ...]

  """
  def list_canines do
    Repo.all(Canine)
  end

  @doc """
  Gets a single canine.

  Raises `Ecto.NoResultsError` if the Canine does not exist.

  ## Examples

      iex> get_canine!(123)
      %Canine{}

      iex> get_canine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_canine!(id), do: Repo.get!(Canine, id)

  @doc """
  Creates a canine.

  ## Examples

      iex> create_canine(%{field: value})
      {:ok, %Canine{}}

      iex> create_canine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_canine(attrs \\ %{}) do
    %Canine{}
    |> Canine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a canine.

  ## Examples

      iex> update_canine(canine, %{field: new_value})
      {:ok, %Canine{}}

      iex> update_canine(canine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_canine(%Canine{} = canine, attrs) do
    canine
    |> Canine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a canine.

  ## Examples

      iex> delete_canine(canine)
      {:ok, %Canine{}}

      iex> delete_canine(canine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_canine(%Canine{} = canine) do
    Repo.delete(canine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking canine changes.

  ## Examples

      iex> change_canine(canine)
      %Ecto.Changeset{data: %Canine{}}

  """
  def change_canine(%Canine{} = canine, attrs \\ %{}) do
    Canine.changeset(canine, attrs)
  end
end
