defmodule IomdbExWeb.ListLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.EquipmentList
  alias IomdbEx.EquipmentList.List

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :equipment_piece_lists, EquipmentList.list_equipment_piece_lists())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit List")
    |> assign(:list, EquipmentList.get_list!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New List")
    |> assign(:list, %List{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Equipment piece lists")
    |> assign(:list, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.ListLive.FormComponent, {:saved, list}}, socket) do
    {:noreply, stream_insert(socket, :equipment_piece_lists, list)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    list = EquipmentList.get_list!(id)
    {:ok, _} = EquipmentList.delete_list(list)

    {:noreply, stream_delete(socket, :equipment_piece_lists, list)}
  end
end
