defmodule IomdbExWeb.PieceLiveTest do
  use IomdbExWeb.ConnCase

  import Phoenix.LiveViewTest
  import IomdbEx.EquipmentFixtures

  @create_attrs %{
    name: "some name",
    special: "some special",
    klass: 42,
    weight: 42,
    tp_value: 42,
    rufrin_price: 42
  }
  @update_attrs %{
    name: "some updated name",
    special: "some updated special",
    klass: 43,
    weight: 43,
    tp_value: 43,
    rufrin_price: 43
  }
  @invalid_attrs %{
    name: nil,
    special: nil,
    klass: nil,
    weight: nil,
    tp_value: nil,
    rufrin_price: nil
  }

  defp create_piece(_) do
    piece = piece_fixture()
    %{piece: piece}
  end

  describe "Index" do
    setup [:create_piece]

    test "lists all equipment_pieces", %{conn: conn, piece: piece} do
      {:ok, _index_live, html} = live(conn, ~p"/equipment_pieces")

      assert html =~ "Listing Equipment pieces"
      assert html =~ piece.name
    end

    test "saves new piece", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_pieces")

      assert index_live |> element("a", "New Piece") |> render_click() =~
               "New Piece"

      assert_patch(index_live, ~p"/equipment_pieces/new")

      assert index_live
             |> form("#piece-form", piece: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#piece-form", piece: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_pieces")

      html = render(index_live)
      assert html =~ "Piece created successfully"
      assert html =~ "some name"
    end

    test "updates piece in listing", %{conn: conn, piece: piece} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_pieces")

      assert index_live |> element("#equipment_pieces-#{piece.id} a", "Edit") |> render_click() =~
               "Edit Piece"

      assert_patch(index_live, ~p"/equipment_pieces/#{piece}/edit")

      assert index_live
             |> form("#piece-form", piece: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#piece-form", piece: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/equipment_pieces")

      html = render(index_live)
      assert html =~ "Piece updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes piece in listing", %{conn: conn, piece: piece} do
      {:ok, index_live, _html} = live(conn, ~p"/equipment_pieces")

      assert index_live |> element("#equipment_pieces-#{piece.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#equipment_pieces-#{piece.id}")
    end
  end

  describe "Show" do
    setup [:create_piece]

    test "displays piece", %{conn: conn, piece: piece} do
      {:ok, _show_live, html} = live(conn, ~p"/equipment_pieces/#{piece}")

      assert html =~ "Show Piece"
      assert html =~ piece.name
    end

    test "updates piece within modal", %{conn: conn, piece: piece} do
      {:ok, show_live, _html} = live(conn, ~p"/equipment_pieces/#{piece}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Piece"

      assert_patch(show_live, ~p"/equipment_pieces/#{piece}/show/edit")

      assert show_live
             |> form("#piece-form", piece: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#piece-form", piece: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/equipment_pieces/#{piece}")

      html = render(show_live)
      assert html =~ "Piece updated successfully"
      assert html =~ "some updated name"
    end
  end
end
