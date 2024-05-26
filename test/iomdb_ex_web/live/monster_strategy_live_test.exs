defmodule IomdbExWeb.MonsterStrategyLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{
    additional_prot_info: "some additional_prot_info",
    walkthrough: "some walkthrough",
    quest_mob: true,
    fight_notes: "some fight_notes"
  }
  @update_attrs %{
    additional_prot_info: "some updated additional_prot_info",
    walkthrough: "some updated walkthrough",
    quest_mob: false,
    fight_notes: "some updated fight_notes"
  }
  @invalid_attrs %{
    additional_prot_info: nil,
    walkthrough: nil,
    quest_mob: false,
    fight_notes: nil
  }

  defp create_monster_strategy(_) do
    monster_strategy = monster_strategy_fixture()
    %{monster_strategy: monster_strategy}
  end

  describe "Index" do
    setup [:create_monster_strategy]

    test "lists all equipment_mob_strategies", %{conn: conn, monster_strategy: monster_strategy} do
      {:ok, _index_live, html} = live(conn, ~p"/equipment_mob_strategies")

      assert html =~ "Listing Equipment mob strategies"
      assert html =~ monster_strategy.additional_prot_info
    end

    test "saves new monster_strategy", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_mob_strategies")

      assert index_live |> element("a", "New Monster strategy") |> render_click() =~
               "New Monster strategy"

      assert_patch(index_live, ~p"/equipment_mob_strategies/new")

      assert index_live
             |> form("#monster_strategy-form", monster_strategy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#monster_strategy-form", monster_strategy: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_mob_strategies")

      html = render(index_live)
      assert html =~ "Monster strategy created successfully"
      assert html =~ "some additional_prot_info"
    end

    test "updates monster_strategy in listing", %{conn: conn, monster_strategy: monster_strategy} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_mob_strategies")

      assert index_live
             |> element("#equipment_mob_strategies-#{monster_strategy.id} a", "Edit")
             |> render_click() =~
               "Edit Monster strategy"

      assert_patch(index_live, ~p"/equipment_mob_strategies/#{monster_strategy}/edit")

      assert index_live
             |> form("#monster_strategy-form", monster_strategy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#monster_strategy-form", monster_strategy: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_mob_strategies")

      html = render(index_live)
      assert html =~ "Monster strategy updated successfully"
      assert html =~ "some updated additional_prot_info"
    end

    test "deletes monster_strategy in listing", %{conn: conn, monster_strategy: monster_strategy} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_mob_strategies")

      assert index_live
             |> element("#equipment_mob_strategies-#{monster_strategy.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#equipment_mob_strategies-#{monster_strategy.id}")
    end
  end

  describe "Show" do
    setup [:create_monster_strategy]

    test "displays monster_strategy", %{conn: conn, monster_strategy: monster_strategy} do
      {:ok, _show_live, html} = live(conn, ~p"/equipment_mob_strategies/#{monster_strategy}")

      assert html =~ "Show Monster strategy"
      assert html =~ monster_strategy.additional_prot_info
    end

    test "updates monster_strategy within modal", %{
      conn: conn,
      monster_strategy: monster_strategy
    } do
      {:ok, show_live, _html} = live(conn, ~p"/equipment_mob_strategies/#{monster_strategy}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Monster strategy"

      assert_patch(show_live, ~p"/equipment_mob_strategies/#{monster_strategy}/show/edit")

      assert show_live
             |> form("#monster_strategy-form", monster_strategy: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#monster_strategy-form", monster_strategy: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/equipment_mob_strategies/#{monster_strategy}")

      html = render(show_live)
      assert html =~ "Monster strategy updated successfully"
      assert html =~ "some updated additional_prot_info"
    end
  end
end
