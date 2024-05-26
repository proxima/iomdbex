defmodule IomdbExWeb.SpellTrainSpecLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.GuildFixtures

  @create_attrs %{max: 42, level: 42}
  @update_attrs %{max: 43, level: 43}
  @invalid_attrs %{max: nil, level: nil}

  defp create_spell_train_spec(_) do
    spell_train_spec = spell_train_spec_fixture()
    %{spell_train_spec: spell_train_spec}
  end

  describe "Index" do
    setup [:create_spell_train_spec]

    test "lists all spell_train_specs", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/spell_train_specs")

      assert html =~ "Listing Spell train specs"
    end

    test "saves new spell_train_spec", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_train_specs")

      assert index_live |> element("a", "New Spell train spec") |> render_click() =~
               "New Spell train spec"

      assert_patch(index_live, ~p"/spell_train_specs/new")

      assert index_live
             |> form("#spell_train_spec-form", spell_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#spell_train_spec-form", spell_train_spec: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/spell_train_specs")

      html = render(index_live)
      assert html =~ "Spell train spec created successfully"
    end

    test "updates spell_train_spec in listing", %{conn: conn, spell_train_spec: spell_train_spec} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_train_specs")

      assert index_live
             |> element("#spell_train_specs-#{spell_train_spec.id} a", "Edit")
             |> render_click() =~
               "Edit Spell train spec"

      assert_patch(index_live, ~p"/spell_train_specs/#{spell_train_spec}/edit")

      assert index_live
             |> form("#spell_train_spec-form", spell_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#spell_train_spec-form", spell_train_spec: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/spell_train_specs")

      html = render(index_live)
      assert html =~ "Spell train spec updated successfully"
    end

    test "deletes spell_train_spec in listing", %{conn: conn, spell_train_spec: spell_train_spec} do
      {:ok, index_live, _html} = live(conn, ~p"/spell_train_specs")

      assert index_live
             |> element("#spell_train_specs-#{spell_train_spec.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#spell_train_specs-#{spell_train_spec.id}")
    end
  end

  describe "Show" do
    setup [:create_spell_train_spec]

    test "displays spell_train_spec", %{conn: conn, spell_train_spec: spell_train_spec} do
      {:ok, _show_live, html} = live(conn, ~p"/spell_train_specs/#{spell_train_spec}")

      assert html =~ "Show Spell train spec"
    end

    test "updates spell_train_spec within modal", %{
      conn: conn,
      spell_train_spec: spell_train_spec
    } do
      {:ok, show_live, _html} = live(conn, ~p"/spell_train_specs/#{spell_train_spec}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Spell train spec"

      assert_patch(show_live, ~p"/spell_train_specs/#{spell_train_spec}/show/edit")

      assert show_live
             |> form("#spell_train_spec-form", spell_train_spec: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#spell_train_spec-form", spell_train_spec: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/spell_train_specs/#{spell_train_spec}")

      html = render(show_live)
      assert html =~ "Spell train spec updated successfully"
    end
  end
end
