defmodule ExMink.Animals.Canine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "canines" do
    field :average_weight_kg, :float
    field :average_weight_pounds, :float
    field :breed, :string
    field :size_category, :string
    field :weight, :string

    timestamps()
  end

  @doc false
  def changeset(canine, attrs) do
    canine
    |> cast(attrs, [:breed, :weight, :average_weight_pounds, :average_weight_kg, :size_category])
    |> validate_required([:breed, :weight, :average_weight_pounds, :average_weight_kg, :size_category])
  end
end
