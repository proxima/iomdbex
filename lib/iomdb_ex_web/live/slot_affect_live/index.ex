defmodule IomdbExWeb.SlotAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.SlotAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :slot_affects, Equipment.list_slot_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Slot affect")
    |> assign(:slot_affect, Equipment.get_slot_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Slot affect")
    |> assign(:slot_affect, %SlotAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Slot affects")
    |> assign(:slot_affect, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.SlotAffectLive.FormComponent, {:saved, slot_affect}}, socket) do
    {:noreply, stream_insert(socket, :slot_affects, slot_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    slot_affect = Equipment.get_slot_affect!(id)
    {:ok, _} = Equipment.delete_slot_affect(slot_affect)

    {:noreply, stream_delete(socket, :slot_affects, slot_affect)}
  end
end
