defmodule ExMink.Repo.Migrations.CreateCanines do
  use Ecto.Migration

  def change do
    create table(:canines) do
      add :breed, :string
      add :weight, :string
      add :average_weight_pounds, :float
      add :average_weight_kg, :float
      add :size_category, :string

      timestamps()
    end
  end
end
