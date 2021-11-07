defmodule ExMinkWeb.Api.CanineView do
  use ExMinkWeb, :view
  alias ExMinkWeb.Api.CanineView

  def render("index.json", %{canines: canines}) do
    %{data: render_many(canines, CanineView, "canine.json")}
  end

  def render("show.json", %{canine: canine}) do
    %{data: render_one(canine, CanineView, "canine.json")}
  end

  def render("canine.json", %{canine: canine}) do
    %{
      id: canine.id,
      breed: canine.breed,
      weight: canine.weight,
      average_weight_pounds: canine.average_weight_pounds,
      average_weight_kg: canine.average_weight_kg,
      size_category: canine.size_category
    }
  end
end
