defmodule IomdbExWeb.SpellAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  defp create_spell_affect(_) do
    spell_affect = spell_affect_fixture()
    %{spell_affect: spell_affect}
  end

  describe "Index" do
    setup [:create_spell_affect]

    test "lists all spell_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/spell_affects")

      assert html =~ "Listing Spell affects"
    end

    test "saves new spell_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_affects")

      assert index_live |> element("a", "New Spell affect") |> render_click() =~
               "New Spell affect"

      assert_patch(index_live, ~p"/spell_affects/new")

      assert index_live
             |> form("#spell_affect-form", spell_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#spell_affect-form", spell_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/spell_affects")

      html = render(index_live)
      assert html =~ "Spell affect created successfully"
    end

    test "updates spell_affect in listing", %{conn: conn, spell_affect: spell_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_affects")

      assert index_live
             |> element("#spell_affects-#{spell_affect.id} a", "Edit")
             |> render_click() =~
               "Edit Spell affect"

      assert_patch(index_live, ~p"/spell_affects/#{spell_affect}/edit")

      assert index_live
             |> form("#spell_affect-form", spell_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#spell_affect-form", spell_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/spell_affects")

      html = render(index_live)
      assert html =~ "Spell affect updated successfully"
    end

    test "deletes spell_affect in listing", %{conn: conn, spell_affect: spell_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_affects")

      assert index_live
             |> element("#spell_affects-#{spell_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#spell_affects-#{spell_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_spell_affect]

    test "displays spell_affect", %{conn: conn, spell_affect: spell_affect} do
      {:ok, _show_live, html} = live(conn, ~p"/spell_affects/#{spell_affect}")

      assert html =~ "Show Spell affect"
    end

    test "updates spell_affect within modal", %{conn: conn, spell_affect: spell_affect} do
      {:ok, show_live, _html} = live(conn, ~p"/spell_affects/#{spell_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Spell affect"

      assert_patch(show_live, ~p"/spell_affects/#{spell_affect}/show/edit")

      assert show_live
             |> form("#spell_affect-form", spell_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#spell_affect-form", spell_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/spell_affects/#{spell_affect}")

      html = render(show_live)
      assert html =~ "Spell affect updated successfully"
    end
  end
end
