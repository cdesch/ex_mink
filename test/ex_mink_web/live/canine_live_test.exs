defmodule ExMinkWeb.CanineLiveTest do
  use ExMinkWeb.ConnCase

  import Phoenix.LiveViewTest
  import ExMink.AnimalsFixtures

  @create_attrs %{average_weight_kg: 120.5, average_weight_pounds: 120.5, breed: "some breed", size_category: "some size_category", weight: "some weight"}
  @update_attrs %{average_weight_kg: 456.7, average_weight_pounds: 456.7, breed: "some updated breed", size_category: "some updated size_category", weight: "some updated weight"}
  @invalid_attrs %{average_weight_kg: nil, average_weight_pounds: nil, breed: nil, size_category: nil, weight: nil}

  defp create_canine(_) do
    canine = canine_fixture()
    %{canine: canine}
  end

  describe "Index" do
    setup [:create_canine]

    test "lists all canines", %{conn: conn, canine: canine} do
      {:ok, _index_live, html} = live(conn, Routes.canine_index_path(conn, :index))

      assert html =~ "Listing Canines"
      assert html =~ canine.breed
    end

    test "saves new canine", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.canine_index_path(conn, :index))

      assert index_live |> element("a", "New Canine") |> render_click() =~
               "New Canine"

      assert_patch(index_live, Routes.canine_index_path(conn, :new))

      assert index_live
             |> form("#canine-form", canine: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#canine-form", canine: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.canine_index_path(conn, :index))

      assert html =~ "Canine created successfully"
      assert html =~ "some breed"
    end

    test "updates canine in listing", %{conn: conn, canine: canine} do
      {:ok, index_live, _html} = live(conn, Routes.canine_index_path(conn, :index))

      assert index_live |> element("#canine-#{canine.id} a", "Edit") |> render_click() =~
               "Edit Canine"

      assert_patch(index_live, Routes.canine_index_path(conn, :edit, canine))

      assert index_live
             |> form("#canine-form", canine: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#canine-form", canine: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.canine_index_path(conn, :index))

      assert html =~ "Canine updated successfully"
      assert html =~ "some updated breed"
    end

    test "deletes canine in listing", %{conn: conn, canine: canine} do
      {:ok, index_live, _html} = live(conn, Routes.canine_index_path(conn, :index))

      assert index_live |> element("#canine-#{canine.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#canine-#{canine.id}")
    end
  end

  describe "Show" do
    setup [:create_canine]

    test "displays canine", %{conn: conn, canine: canine} do
      {:ok, _show_live, html} = live(conn, Routes.canine_show_path(conn, :show, canine))

      assert html =~ "Show Canine"
      assert html =~ canine.breed
    end

    test "updates canine within modal", %{conn: conn, canine: canine} do
      {:ok, show_live, _html} = live(conn, Routes.canine_show_path(conn, :show, canine))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Canine"

      assert_patch(show_live, Routes.canine_show_path(conn, :edit, canine))

      assert show_live
             |> form("#canine-form", canine: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#canine-form", canine: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.canine_show_path(conn, :show, canine))

      assert html =~ "Canine updated successfully"
      assert html =~ "some updated breed"
    end
  end
end
