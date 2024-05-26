defmodule IomdbExWeb.PieceLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:equipment_monsters, [])

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    socket =
      socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
      |> assign(:piece, Equipment.get_piece!(id))

    {:noreply, socket}
  end

  defp page_title(:show), do: "Show Piece"
  defp page_title(:edit), do: "Edit Piece"
end
