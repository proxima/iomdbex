defmodule IomdbExWeb.ListLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.EquipmentList
  alias IomdbExWeb.Components.Piece.IndexComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:list, EquipmentList.get_list!(id))}
  end

  defp page_title(:show), do: "Show List"
  defp page_title(:edit), do: "Edit List"
end
