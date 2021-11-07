defmodule ExMinkWeb.Api.CanineControllerTest do
  use ExMinkWeb.ConnCase

  import ExMink.AnimalsFixtures

  alias ExMink.Animals.Canine

  @create_attrs %{
    average_weight_kg: 120.5,
    average_weight_pounds: 120.5,
    breed: "some breed",
    size_category: "some size_category",
    weight: "some weight"
  }
  @update_attrs %{
    average_weight_kg: 456.7,
    average_weight_pounds: 456.7,
    breed: "some updated breed",
    size_category: "some updated size_category",
    weight: "some updated weight"
  }
  @invalid_attrs %{average_weight_kg: nil, average_weight_pounds: nil, breed: nil, size_category: nil, weight: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all canines", %{conn: conn} do
      conn = get(conn, Routes.api_canine_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create canine" do
    test "renders canine when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_canine_path(conn, :create), canine: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_canine_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "average_weight_kg" => 120.5,
               "average_weight_pounds" => 120.5,
               "breed" => "some breed",
               "size_category" => "some size_category",
               "weight" => "some weight"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_canine_path(conn, :create), canine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update canine" do
    setup [:create_canine]

    test "renders canine when data is valid", %{conn: conn, canine: %Canine{id: id} = canine} do
      conn = put(conn, Routes.api_canine_path(conn, :update, canine), canine: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_canine_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "average_weight_kg" => 456.7,
               "average_weight_pounds" => 456.7,
               "breed" => "some updated breed",
               "size_category" => "some updated size_category",
               "weight" => "some updated weight"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, canine: canine} do
      conn = put(conn, Routes.api_canine_path(conn, :update, canine), canine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete canine" do
    setup [:create_canine]

    test "deletes chosen canine", %{conn: conn, canine: canine} do
      conn = delete(conn, Routes.api_canine_path(conn, :delete, canine))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_canine_path(conn, :show, canine))
      end
    end
  end

  defp create_canine(_) do
    canine = canine_fixture()
    %{canine: canine}
  end
end
