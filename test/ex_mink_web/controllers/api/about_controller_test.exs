defmodule ExMinkWeb.Api.AboutControllerTest do
  use ExMinkWeb.ConnCase

  import ExMink.InformationFixtures
  import ExMink.Util

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all about", %{conn: conn} do
      conn = get(conn, Routes.api_about_path(conn, :index))
      about = about_fixture() |> atom_to_string_map()
      assert json_response(conn, 200) == about
    end
  end
end
