defmodule IomdbExWeb.WeaponDamageAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_weapon_damage_affect(_) do
    weapon_damage_affect = weapon_damage_affect_fixture()
    %{weapon_damage_affect: weapon_damage_affect}
  end

  describe "Index" do
    setup [:create_weapon_damage_affect]

    test "lists all weapon_damage_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/weapon_damage_affects")

      assert html =~ "Listing Weapon damage affects"
    end

    test "saves new weapon_damage_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/weapon_damage_affects")

      assert index_live |> element("a", "New Weapon damage affect") |> render_click() =~
               "New Weapon damage affect"

      assert_patch(index_live, ~p"/weapon_damage_affects/new")

      assert index_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/weapon_damage_affects")

      html = render(index_live)
      assert html =~ "Weapon damage affect created successfully"
    end

    test "updates weapon_damage_affect in listing", %{
      conn: conn,
      weapon_damage_affect: weapon_damage_affect
    } do
      {:ok, index_live, _html} = live(conn, ~p"/weapon_damage_affects")

      assert index_live
             |> element("#weapon_damage_affects-#{weapon_damage_affect.id} a", "Edit")
             |> render_click() =~
               "Edit Weapon damage affect"

      assert_patch(index_live, ~p"/weapon_damage_affects/#{weapon_damage_affect}/edit")

      assert index_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/weapon_damage_affects")

      html = render(index_live)
      assert html =~ "Weapon damage affect updated successfully"
    end

    test "deletes weapon_damage_affect in listing", %{
      conn: conn,
      weapon_damage_affect: weapon_damage_affect
    } do
      {:ok, index_live, _html} = live(conn, ~p"/weapon_damage_affects")

      assert index_live
             |> element("#weapon_damage_affects-#{weapon_damage_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#weapon_damage_affects-#{weapon_damage_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_weapon_damage_affect]

    test "displays weapon_damage_affect", %{
      conn: conn,
      weapon_damage_affect: weapon_damage_affect
    } do
      {:ok, _show_live, html} = live(conn, ~p"/weapon_damage_affects/#{weapon_damage_affect}")

      assert html =~ "Show Weapon damage affect"
    end

    test "updates weapon_damage_affect within modal", %{
      conn: conn,
      weapon_damage_affect: weapon_damage_affect
    } do
      {:ok, show_live, _html} = live(conn, ~p"/weapon_damage_affects/#{weapon_damage_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Weapon damage affect"

      assert_patch(show_live, ~p"/weapon_damage_affects/#{weapon_damage_affect}/show/edit")

      assert show_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#weapon_damage_affect-form", weapon_damage_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/weapon_damage_affects/#{weapon_damage_affect}")

      html = render(show_live)
      assert html =~ "Weapon damage affect updated successfully"
    end
  end
end
