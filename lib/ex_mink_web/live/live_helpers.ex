defmodule ExMinkWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `ExMinkWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal ExMinkWeb.CanineLive.FormComponent,
        id: @canine.id || :new,
        action: @live_action,
        canine: @canine,
        return_to: Routes.canine_index_path(@socket, :index) %>
  """
  def live_modal(component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(ExMinkWeb.ModalComponent, modal_opts)
  end
end
