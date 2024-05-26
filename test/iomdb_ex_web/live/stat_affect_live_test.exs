defmodule IomdbExWeb.StatAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  defp create_stat_affect(_) do
    stat_affect = stat_affect_fixture()
    %{stat_affect: stat_affect}
  end

  describe "Index" do
    setup [:create_stat_affect]

    test "lists all stat_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/stat_affects")

      assert html =~ "Listing Stat affects"
    end

    test "saves new stat_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/stat_affects")

      assert index_live |> element("a", "New Stat affect") |> render_click() =~
               "New Stat affect"

      assert_patch(index_live, ~p"/stat_affects/new")

      assert index_live
             |> form("#stat_affect-form", stat_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stat_affect-form", stat_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stat_affects")

      html = render(index_live)
      assert html =~ "Stat affect created successfully"
    end

    test "updates stat_affect in listing", %{conn: conn, stat_affect: stat_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/stat_affects")

      assert index_live |> element("#stat_affects-#{stat_affect.id} a", "Edit") |> render_click() =~
               "Edit Stat affect"

      assert_patch(index_live, ~p"/stat_affects/#{stat_affect}/edit")

      assert index_live
             |> form("#stat_affect-form", stat_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#stat_affect-form", stat_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stat_affects")

      html = render(index_live)
      assert html =~ "Stat affect updated successfully"
    end

    test "deletes stat_affect in listing", %{conn: conn, stat_affect: stat_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/stat_affects")

      assert index_live
             |> element("#stat_affects-#{stat_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#stat_affects-#{stat_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_stat_affect]

    test "displays stat_affect", %{conn: conn, stat_affect: stat_affect} do
      {:ok, _show_live, html} = live(conn, ~p"/stat_affects/#{stat_affect}")

      assert html =~ "Show Stat affect"
    end

    test "updates stat_affect within modal", %{conn: conn, stat_affect: stat_affect} do
      {:ok, show_live, _html} = live(conn, ~p"/stat_affects/#{stat_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Stat affect"

      assert_patch(show_live, ~p"/stat_affects/#{stat_affect}/show/edit")

      assert show_live
             |> form("#stat_affect-form", stat_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#stat_affect-form", stat_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/stat_affects/#{stat_affect}")

      html = render(show_live)
      assert html =~ "Stat affect updated successfully"
    end
  end
end
