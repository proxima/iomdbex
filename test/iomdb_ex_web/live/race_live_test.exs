defmodule IomdbExWeb.RaceLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.GameFixtures

  @create_attrs %{
    name: "some name",
    description: "some description",
    strength: 42,
    dexterity: 42,
    constitution: 42,
    intelligence: 42,
    wisdom: 42,
    stamina: 42,
    charisma: 42,
    hpregen: 42,
    spregen: 42,
    epregen: 42,
    skill_max: 42,
    spell_max: 42,
    skill_rate: 42.0,
    spell_rate: 42.0,
    experience_rate: 42.0,
    need_dark_to_regen: true,
    need_light_to_regen: true,
    corpse_eating: true,
    average_height: 42,
    average_weight: 42
  }
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    strength: 43,
    dexterity: 43,
    constitution: 43,
    intelligence: 43,
    wisdom: 43,
    stamina: 43,
    charisma: 43,
    hpregen: 43,
    spregen: 43,
    epregen: 43,
    skill_max: 43,
    spell_max: 43,
    skill_rate: 43.0,
    spell_rate: 43.0,
    experience_rate: 43.0,
    need_dark_to_regen: false,
    need_light_to_regen: false,
    corpse_eating: false,
    average_height: 43,
    average_weight: 43
  }
  @invalid_attrs %{
    name: nil,
    description: nil,
    strength: nil,
    dexterity: nil,
    constitution: nil,
    intelligence: nil,
    wisdom: nil,
    stamina: nil,
    charisma: nil,
    hpregen: nil,
    spregen: nil,
    epregen: nil,
    skill_max: nil,
    spell_max: nil,
    skill_rate: nil,
    spell_rate: nil,
    experience_rate: nil,
    need_dark_to_regen: false,
    need_light_to_regen: false,
    corpse_eating: false,
    average_height: nil,
    average_weight: nil
  }

  defp create_race(_) do
    race = race_fixture()
    %{race: race}
  end

  describe "Index" do
    setup [:create_race]

    test "lists all races", %{conn: conn, race: race} do
      {:ok, _index_live, html} = live(conn, ~p"/races")

      assert html =~ "Listing Races"
      assert html =~ race.name
    end

    test "saves new race", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/races")

      assert index_live |> element("a", "New Race") |> render_click() =~
               "New Race"

      assert_patch(index_live, ~p"/races/new")

      assert index_live
             |> form("#race-form", race: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#race-form", race: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/races")

      html = render(index_live)
      assert html =~ "Race created successfully"
      assert html =~ "some name"
    end

    test "updates race in listing", %{conn: conn, race: race} do
      {:ok, index_live, _html} = live(conn, ~p"/races")

      assert index_live |> element("#races-#{race.id} a", "Edit") |> render_click() =~
               "Edit Race"

      assert_patch(index_live, ~p"/races/#{race}/edit")

      assert index_live
             |> form("#race-form", race: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#race-form", race: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/races")

      html = render(index_live)
      assert html =~ "Race updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes race in listing", %{conn: conn, race: race} do
      {:ok, index_live, _html} = live(conn, ~p"/races")

      assert index_live |> element("#races-#{race.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#races-#{race.id}")
    end
  end

  describe "Show" do
    setup [:create_race]

    test "displays race", %{conn: conn, race: race} do
      {:ok, _show_live, html} = live(conn, ~p"/races/#{race}")

      assert html =~ "Show Race"
      assert html =~ race.name
    end

    test "updates race within modal", %{conn: conn, race: race} do
      {:ok, show_live, _html} = live(conn, ~p"/races/#{race}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Race"

      assert_patch(show_live, ~p"/races/#{race}/show/edit")

      assert show_live
             |> form("#race-form", race: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#race-form", race: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/races/#{race}")

      html = render(show_live)
      assert html =~ "Race updated successfully"
      assert html =~ "some updated name"
    end
  end
end
