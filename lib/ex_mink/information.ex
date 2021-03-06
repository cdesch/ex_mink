defmodule ExMink.Information do
  @moduledoc """
  The Information context.
  """

  import Ecto.Query, warn: false

  # alias ExMink.Information.About

  @doc """
  Returns the list of about.

  ## Examples

      iex> list_about()
      [%About{}, ...]

  """
  def about do
    %{
      name: Atom.to_string(Mix.Project.config()[:app]),
      version: Mix.Project.config()[:version],
      elixir_version: System.version(),
      status: "online"
    }
  end


end
