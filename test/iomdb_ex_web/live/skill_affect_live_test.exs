defmodule IomdbExWeb.SkillAffectLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  defp create_skill_affect(_) do
    skill_affect = skill_affect_fixture()
    %{skill_affect: skill_affect}
  end

  describe "Index" do
    setup [:create_skill_affect]

    test "lists all skill_affects", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/skill_affects")

      assert html =~ "Listing Skill affects"
    end

    test "saves new skill_affect", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_affects")

      assert index_live |> element("a", "New Skill affect") |> render_click() =~
               "New Skill affect"

      assert_patch(index_live, ~p"/skill_affects/new")

      assert index_live
             |> form("#skill_affect-form", skill_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#skill_affect-form", skill_affect: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/skill_affects")

      html = render(index_live)
      assert html =~ "Skill affect created successfully"
    end

    test "updates skill_affect in listing", %{conn: conn, skill_affect: skill_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_affects")

      assert index_live
             |> element("#skill_affects-#{skill_affect.id} a", "Edit")
             |> render_click() =~
               "Edit Skill affect"

      assert_patch(index_live, ~p"/skill_affects/#{skill_affect}/edit")

      assert index_live
             |> form("#skill_affect-form", skill_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#skill_affect-form", skill_affect: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/skill_affects")

      html = render(index_live)
      assert html =~ "Skill affect updated successfully"
    end

    test "deletes skill_affect in listing", %{conn: conn, skill_affect: skill_affect} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_affects")

      assert index_live
             |> element("#skill_affects-#{skill_affect.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#skill_affects-#{skill_affect.id}")
    end
  end

  describe "Show" do
    setup [:create_skill_affect]

    test "displays skill_affect", %{conn: conn, skill_affect: skill_affect} do
      {:ok, _show_live, html} = live(conn, ~p"/skill_affects/#{skill_affect}")

      assert html =~ "Show Skill affect"
    end

    test "updates skill_affect within modal", %{conn: conn, skill_affect: skill_affect} do
      {:ok, show_live, _html} = live(conn, ~p"/skill_affects/#{skill_affect}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Skill affect"

      assert_patch(show_live, ~p"/skill_affects/#{skill_affect}/show/edit")

      assert show_live
             |> form("#skill_affect-form", skill_affect: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#skill_affect-form", skill_affect: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/skill_affects/#{skill_affect}")

      html = render(show_live)
      assert html =~ "Skill affect updated successfully"
    end
  end
end
