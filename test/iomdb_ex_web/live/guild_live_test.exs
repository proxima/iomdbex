defmodule IomdbExWeb.GuildLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.GuildsFixtures

  @create_attrs %{name: "some name", location: "some location", levels: 42}
  @update_attrs %{name: "some updated name", location: "some updated location", levels: 43}
  @invalid_attrs %{name: nil, location: nil, levels: nil}

  defp create_guild(_) do
    guild = guild_fixture()
    %{guild: guild}
  end

  describe "Index" do
    setup [:create_guild]

    test "lists all guilds", %{conn: conn, guild: guild} do
      {:ok, _index_live, html} = live(conn, ~p"/guilds")

      assert html =~ "Listing Guilds"
      assert html =~ guild.name
    end

    test "saves new guild", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/guilds")

      assert index_live |> element("a", "New Guild") |> render_click() =~
               "New Guild"

      assert_patch(index_live, ~p"/guilds/new")

      assert index_live
             |> form("#guild-form", guild: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#guild-form", guild: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/guilds")

      html = render(index_live)
      assert html =~ "Guild created successfully"
      assert html =~ "some name"
    end

    test "updates guild in listing", %{conn: conn, guild: guild} do
      {:ok, index_live, _html} = live(conn, ~p"/guilds")

      assert index_live |> element("#guilds-#{guild.id} a", "Edit") |> render_click() =~
               "Edit Guild"

      assert_patch(index_live, ~p"/guilds/#{guild}/edit")

      assert index_live
             |> form("#guild-form", guild: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#guild-form", guild: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/guilds")

      html = render(index_live)
      assert html =~ "Guild updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes guild in listing", %{conn: conn, guild: guild} do
      {:ok, index_live, _html} = live(conn, ~p"/guilds")

      assert index_live |> element("#guilds-#{guild.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#guilds-#{guild.id}")
    end
  end

  describe "Show" do
    setup [:create_guild]

    test "displays guild", %{conn: conn, guild: guild} do
      {:ok, _show_live, html} = live(conn, ~p"/guilds/#{guild}")

      assert html =~ "Show Guild"
      assert html =~ guild.name
    end

    test "updates guild within modal", %{conn: conn, guild: guild} do
      {:ok, show_live, _html} = live(conn, ~p"/guilds/#{guild}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Guild"

      assert_patch(show_live, ~p"/guilds/#{guild}/show/edit")

      assert show_live
             |> form("#guild-form", guild: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#guild-form", guild: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/guilds/#{guild}")

      html = render(show_live)
      assert html =~ "Guild updated successfully"
      assert html =~ "some updated name"
    end
  end
end
