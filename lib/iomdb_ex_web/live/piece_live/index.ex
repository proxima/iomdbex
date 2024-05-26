defmodule IomdbExWeb.PieceLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.Piece

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> stream(:equipment_pieces, Equipment.list_equipment_pieces())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Piece")
    |> assign(:piece, Equipment.get_piece!(id))
  end

  defp apply_action(socket, :new, params) do
    socket
    |> assign(:page_title, "New Piece")
    |> assign(:piece, %Piece{equipment_monster_id: Map.get(params, "equipment_monster_id")})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Equipment pieces")
    |> assign(:piece, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.PieceLive.FormComponent, {:saved, piece}}, socket) do
    {:noreply, stream_insert(socket, :equipment_pieces, piece)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    piece = Equipment.get_piece!(id)
    {:ok, _} = Equipment.delete_piece(piece)

    {:noreply, stream_delete(socket, :equipment_pieces, piece)}
  end
end
