defmodule IomdbExWeb.EntryLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.EquipmentList
  alias IomdbEx.EquipmentList.Entry

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     stream(
       socket,
       :equipment_piece_list_entries,
       EquipmentList.list_equipment_piece_list_entries()
     )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Entry")
    |> assign(:entry, EquipmentList.get_entry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Entry")
    |> assign(:entry, %Entry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Equipment piece list entries")
    |> assign(:entry, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.EntryLive.FormComponent, {:saved, entry}}, socket) do
    {:noreply, stream_insert(socket, :equipment_piece_list_entries, entry)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    entry = EquipmentList.get_entry!(id)
    {:ok, _} = EquipmentList.delete_entry(entry)

    {:noreply, stream_delete(socket, :equipment_piece_list_entries, entry)}
  end
end
