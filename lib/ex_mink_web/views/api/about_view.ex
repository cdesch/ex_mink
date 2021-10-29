defmodule ExMinkWeb.Api.AboutView do
  use ExMinkWeb, :view
  alias ExMinkWeb.Api.AboutView

  def render("about.json", %{about: about}) do
    %{
      name: about.name,
      version: about.version,
      elixir_version: about.elixir_version,
      status: about.status
    }
  end
end
