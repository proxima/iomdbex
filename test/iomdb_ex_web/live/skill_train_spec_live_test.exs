defmodule IomdbExWeb.SkillTrainSpecLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.GuildFixtures

  @create_attrs %{max: 42, level: 42}
  @update_attrs %{max: 43, level: 43}
  @invalid_attrs %{max: nil, level: nil}

  defp create_skill_train_spec(_) do
    skill_train_spec = skill_train_spec_fixture()
    %{skill_train_spec: skill_train_spec}
  end

  describe "Index" do
    setup [:create_skill_train_spec]

    test "lists all skill_train_specs", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/skill_train_specs")

      assert html =~ "Listing Skill train specs"
    end

    test "saves new skill_train_spec", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_train_specs")

      assert index_live |> element("a", "New Skill train spec") |> render_click() =~
               "New Skill train spec"

      assert_patch(index_live, ~p"/skill_train_specs/new")

      assert index_live
             |> form("#skill_train_spec-form", skill_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#skill_train_spec-form", skill_train_spec: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/skill_train_specs")

      html = render(index_live)
      assert html =~ "Skill train spec created successfully"
    end

    test "updates skill_train_spec in listing", %{conn: conn, skill_train_spec: skill_train_spec} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_train_specs")

      assert index_live
             |> element("#skill_train_specs-#{skill_train_spec.id} a", "Edit")
             |> render_click() =~
               "Edit Skill train spec"

      assert_patch(index_live, ~p"/skill_train_specs/#{skill_train_spec}/edit")

      assert index_live
             |> form("#skill_train_spec-form", skill_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#skill_train_spec-form", skill_train_spec: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/skill_train_specs")

      html = render(index_live)
      assert html =~ "Skill train spec updated successfully"
    end

    test "deletes skill_train_spec in listing", %{conn: conn, skill_train_spec: skill_train_spec} do
      {:ok, index_live, _html} = live(conn, ~p"/skill_train_specs")

      assert index_live
             |> element("#skill_train_specs-#{skill_train_spec.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#skill_train_specs-#{skill_train_spec.id}")
    end
  end

  describe "Show" do
    setup [:create_skill_train_spec]

    test "displays skill_train_spec", %{conn: conn, skill_train_spec: skill_train_spec} do
      {:ok, _show_live, html} = live(conn, ~p"/skill_train_specs/#{skill_train_spec}")

      assert html =~ "Show Skill train spec"
    end

    test "updates skill_train_spec within modal", %{
      conn: conn,
      skill_train_spec: skill_train_spec
    } do
      {:ok, show_live, _html} = live(conn, ~p"/skill_train_specs/#{skill_train_spec}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Skill train spec"

      assert_patch(show_live, ~p"/skill_train_specs/#{skill_train_spec}/show/edit")

      assert show_live
             |> form("#skill_train_spec-form", skill_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#skill_train_spec-form", skill_train_spec: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/skill_train_specs/#{skill_train_spec}")

      html = render(show_live)
      assert html =~ "Skill train spec updated successfully"
    end
  end
end
