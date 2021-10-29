defmodule ExMinkWeb.Api.AboutController do
  use ExMinkWeb, :controller

  alias ExMink.Information
  # alias ExMink.Information.About

  action_fallback ExMinkWeb.FallbackController

  def index(conn, _params) do
    about = Information.about()
    render(conn, "about.json", about: about)
  end

end
