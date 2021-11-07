defmodule ExMinkWeb.CanineLive.Show do
  use ExMinkWeb, :live_view

  alias ExMink.Animals

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:canine, Animals.get_canine!(id))}
  end

  defp page_title(:show), do: "Show Canine"
  defp page_title(:edit), do: "Edit Canine"
end
