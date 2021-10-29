defmodule ExMinkWeb.PageController do
  use ExMinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
