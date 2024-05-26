defmodule IomdbExWeb.SlotAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  defp create_slot_affect(_) do
    slot_affect = slot_affect_fixture()
    %{slot_affect: slot_affect}
  end

  describe "Index" do
    setup [:create_slot_affect]

    test "lists all slot_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/slot_affects")

      assert html =~ "Listing Slot affects"
    end

    test "saves new slot_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/slot_affects")

      assert index_live |> element("a", "New Slot affect") |> render_click() =~
               "New Slot affect"

      assert_patch(index_live, ~p"/slot_affects/new")

      assert index_live
             |> form("#slot_affect-form", slot_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#slot_affect-form", slot_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/slot_affects")

      html = render(index_live)
      assert html =~ "Slot affect created successfully"
    end

    test "updates slot_affect in listing", %{conn: conn, slot_affect: slot_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/slot_affects")

      assert index_live |> element("#slot_affects-#{slot_affect.id} a", "Edit") |> render_click() =~
               "Edit Slot affect"

      assert_patch(index_live, ~p"/slot_affects/#{slot_affect}/edit")

      assert index_live
             |> form("#slot_affect-form", slot_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#slot_affect-form", slot_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/slot_affects")

      html = render(index_live)
      assert html =~ "Slot affect updated successfully"
    end

    test "deletes slot_affect in listing", %{conn: conn, slot_affect: slot_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/slot_affects")

      assert index_live
             |> element("#slot_affects-#{slot_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#slot_affects-#{slot_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_slot_affect]

    test "displays slot_affect", %{conn: conn, slot_affect: slot_affect} do
      {:ok, _show_live, html} = live(conn, ~p"/slot_affects/#{slot_affect}")

      assert html =~ "Show Slot affect"
    end

    test "updates slot_affect within modal", %{conn: conn, slot_affect: slot_affect} do
      {:ok, show_live, _html} = live(conn, ~p"/slot_affects/#{slot_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Slot affect"

      assert_patch(show_live, ~p"/slot_affects/#{slot_affect}/show/edit")

      assert show_live
             |> form("#slot_affect-form", slot_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#slot_affect-form", slot_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/slot_affects/#{slot_affect}")

      html = render(show_live)
      assert html =~ "Slot affect updated successfully"
    end
  end
end
