defmodule IomdbExWeb.MonsterLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_monster(_) do
    monster = monster_fixture()
    %{monster: monster}
  end

  describe "Index" do
    setup [:create_monster]

    test "lists all equipment_monsters", %{conn: conn, monster: monster} do
      {:ok, _index_live, html} = live(conn, ~p"/equipment_monsters")

      assert html =~ "Listing Equipment monsters"
      assert html =~ monster.name
    end

    test "saves new monster", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_monsters")

      assert index_live |> element("a", "New Monster") |> render_click() =~
               "New Monster"

      assert_patch(index_live, ~p"/equipment_monsters/new")

      assert index_live
             |> form("#monster-form", monster: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#monster-form", monster: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_monsters")

      html = render(index_live)
      assert html =~ "Monster created successfully"
      assert html =~ "some name"
    end

    test "updates monster in listing", %{conn: conn, monster: monster} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_monsters")

      assert index_live
             |> element("#equipment_monsters-#{monster.id} a", "Edit")
             |> render_click() =~
               "Edit Monster"

      assert_patch(index_live, ~p"/equipment_monsters/#{monster}/edit")

      assert index_live
             |> form("#monster-form", monster: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#monster-form", monster: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_monsters")

      html = render(index_live)
      assert html =~ "Monster updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes monster in listing", %{conn: conn, monster: monster} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_monsters")

      assert index_live
             |> element("#equipment_monsters-#{monster.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#equipment_monsters-#{monster.id}")
    end
  end

  describe "Show" do
    setup [:create_monster]

    test "displays monster", %{conn: conn, monster: monster} do
      {:ok, _show_live, html} = live(conn, ~p"/equipment_monsters/#{monster}")

      assert html =~ "Show Monster"
      assert html =~ monster.name
    end

    test "updates monster within modal", %{conn: conn, monster: monster} do
      {:ok, show_live, _html} = live(conn, ~p"/equipment_monsters/#{monster}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Monster"

      assert_patch(show_live, ~p"/equipment_monsters/#{monster}/show/edit")

      assert show_live
             |> form("#monster-form", monster: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#monster-form", monster: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/equipment_monsters/#{monster}")

      html = render(show_live)
      assert html =~ "Monster updated successfully"
      assert html =~ "some updated name"
    end
  end
end
