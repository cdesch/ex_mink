defmodule ExMinkWeb.Api.CanineController do
  use ExMinkWeb, :controller

  alias ExMink.Animals
  alias ExMink.Animals.Canine

  action_fallback ExMinkWeb.FallbackController

  def index(conn, _params) do
    canines = Animals.list_canines()
    render(conn, "index.json", canines: canines)
  end

  def create(conn, %{"canine" => canine_params}) do
    with {:ok, %Canine{} = canine} <- Animals.create_canine(canine_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_canine_path(conn, :show, canine))
      |> render("show.json", canine: canine)
    end
  end

  def show(conn, %{"id" => id}) do
    canine = Animals.get_canine!(id)
    render(conn, "show.json", canine: canine)
  end

  def update(conn, %{"id" => id, "canine" => canine_params}) do
    canine = Animals.get_canine!(id)

    with {:ok, %Canine{} = canine} <- Animals.update_canine(canine, canine_params) do
      render(conn, "show.json", canine: canine)
    end
  end

  def delete(conn, %{"id" => id}) do
    canine = Animals.get_canine!(id)

    with {:ok, %Canine{}} <- Animals.delete_canine(canine) do
      send_resp(conn, :no_content, "")
    end
  end
end
