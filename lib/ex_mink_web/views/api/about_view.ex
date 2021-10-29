defmodule ExMinkWeb.Api.AboutView do
  use ExMinkWeb, :view
  alias ExMinkWeb.Api.AboutView

  # def render("index.json", %{about: about}) do
  #   %{data: render_many(about, AboutView, "about.json")}
  # end

  # def render("show.json", %{about: about}) do
  #   %{data: render_one(about, AboutView, "about.json")}
  # end

  def render("about.json", %{about: about}) do
    %{
      # id: about.id,
      name: about.name,
      version: about.version,
      elixir_version: about.elixir_version,
      status: about.status
    }
  end
end
