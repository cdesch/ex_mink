defmodule ExMinkWeb.CanineLive.Index do
  use ExMinkWeb, :live_view

  alias ExMink.Animals
  alias ExMink.Animals.Canine

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :canines, list_canines())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Canine")
    |> assign(:canine, Animals.get_canine!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Canine")
    |> assign(:canine, %Canine{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Canines")
    |> assign(:canine, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    canine = Animals.get_canine!(id)
    {:ok, _} = Animals.delete_canine(canine)

    {:noreply, assign(socket, :canines, list_canines())}
  end

  defp list_canines do
    Animals.list_canines()
  end
end
