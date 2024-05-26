defmodule IomdbExWeb.ResistanceAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  defp create_resistance_affect(_) do
    resistance_affect = resistance_affect_fixture()
    %{resistance_affect: resistance_affect}
  end

  describe "Index" do
    setup [:create_resistance_affect]

    test "lists all resistance_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/resistance_affects")

      assert html =~ "Listing Resistance affects"
    end

    test "saves new resistance_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/resistance_affects")

      assert index_live |> element("a", "New Resistance affect") |> render_click() =~
               "New Resistance affect"

      assert_patch(index_live, ~p"/resistance_affects/new")

      assert index_live
             |> form("#resistance_affect-form", resistance_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resistance_affect-form", resistance_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resistance_affects")

      html = render(index_live)
      assert html =~ "Resistance affect created successfully"
    end

    test "updates resistance_affect in listing", %{
      conn: conn,
      resistance_affect: resistance_affect
    } do
      {:ok, index_live, _html} = live(conn, ~p"/resistance_affects")

      assert index_live
             |> element("#resistance_affects-#{resistance_affect.id} a", "Edit")
             |> render_click() =~
               "Edit Resistance affect"

      assert_patch(index_live, ~p"/resistance_affects/#{resistance_affect}/edit")

      assert index_live
             |> form("#resistance_affect-form", resistance_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resistance_affect-form", resistance_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resistance_affects")

      html = render(index_live)
      assert html =~ "Resistance affect updated successfully"
    end

    test "deletes resistance_affect in listing", %{
      conn: conn,
      resistance_affect: resistance_affect
    } do
      {:ok, index_live, _html} = live(conn, ~p"/resistance_affects")

      assert index_live
             |> element("#resistance_affects-#{resistance_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#resistance_affects-#{resistance_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_resistance_affect]

    test "displays resistance_affect", %{conn: conn, resistance_affect: resistance_affect} do
      {:ok, _show_live, html} = live(conn, ~p"/resistance_affects/#{resistance_affect}")

      assert html =~ "Show Resistance affect"
    end

    test "updates resistance_affect within modal", %{
      conn: conn,
      resistance_affect: resistance_affect
    } do
      {:ok, show_live, _html} = live(conn, ~p"/resistance_affects/#{resistance_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Resistance affect"

      assert_patch(show_live, ~p"/resistance_affects/#{resistance_affect}/show/edit")

      assert show_live
             |> form("#resistance_affect-form", resistance_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#resistance_affect-form", resistance_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/resistance_affects/#{resistance_affect}")

      html = render(show_live)
      assert html =~ "Resistance affect updated successfully"
    end
  end
end
