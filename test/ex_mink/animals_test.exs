defmodule ExMink.AnimalsTest do
  use ExMink.DataCase

  alias ExMink.Animals

  describe "canines" do
    alias ExMink.Animals.Canine

    import ExMink.AnimalsFixtures

    @invalid_attrs %{average_weight_kg: nil, average_weight_pounds: nil, breed: nil, size_category: nil, weight: nil}

    test "list_canines/0 returns all canines" do
      canine = canine_fixture()
      assert Animals.list_canines() == [canine]
    end

    test "get_canine!/1 returns the canine with given id" do
      canine = canine_fixture()
      assert Animals.get_canine!(canine.id) == canine
    end

    test "create_canine/1 with valid data creates a canine" do
      valid_attrs = %{average_weight_kg: 120.5, average_weight_pounds: 120.5, breed: "some breed", size_category: "some size_category", weight: "some weight"}

      assert {:ok, %Canine{} = canine} = Animals.create_canine(valid_attrs)
      assert canine.average_weight_kg == 120.5
      assert canine.average_weight_pounds == 120.5
      assert canine.breed == "some breed"
      assert canine.size_category == "some size_category"
      assert canine.weight == "some weight"
    end

    test "create_canine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_canine(@invalid_attrs)
    end

    test "update_canine/2 with valid data updates the canine" do
      canine = canine_fixture()
      update_attrs = %{average_weight_kg: 456.7, average_weight_pounds: 456.7, breed: "some updated breed", size_category: "some updated size_category", weight: "some updated weight"}

      assert {:ok, %Canine{} = canine} = Animals.update_canine(canine, update_attrs)
      assert canine.average_weight_kg == 456.7
      assert canine.average_weight_pounds == 456.7
      assert canine.breed == "some updated breed"
      assert canine.size_category == "some updated size_category"
      assert canine.weight == "some updated weight"
    end

    test "update_canine/2 with invalid data returns error changeset" do
      canine = canine_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_canine(canine, @invalid_attrs)
      assert canine == Animals.get_canine!(canine.id)
    end

    test "delete_canine/1 deletes the canine" do
      canine = canine_fixture()
      assert {:ok, %Canine{}} = Animals.delete_canine(canine)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_canine!(canine.id) end
    end

    test "change_canine/1 returns a canine changeset" do
      canine = canine_fixture()
      assert %Ecto.Changeset{} = Animals.change_canine(canine)
    end
  end
end
