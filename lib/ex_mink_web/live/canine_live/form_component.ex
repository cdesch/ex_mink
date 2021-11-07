defmodule ExMinkWeb.CanineLive.FormComponent do
  use ExMinkWeb, :live_component

  alias ExMink.Animals

  @impl true
  def update(%{canine: canine} = assigns, socket) do
    changeset = Animals.change_canine(canine)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"canine" => canine_params}, socket) do
    changeset =
      socket.assigns.canine
      |> Animals.change_canine(canine_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"canine" => canine_params}, socket) do
    save_canine(socket, socket.assigns.action, canine_params)
  end

  defp save_canine(socket, :edit, canine_params) do
    case Animals.update_canine(socket.assigns.canine, canine_params) do
      {:ok, _canine} ->
        {:noreply,
         socket
         |> put_flash(:info, "Canine updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_canine(socket, :new, canine_params) do
    case Animals.create_canine(canine_params) do
      {:ok, _canine} ->
        {:noreply,
         socket
         |> put_flash(:info, "Canine created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
