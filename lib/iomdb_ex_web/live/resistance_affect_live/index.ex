defmodule IomdbExWeb.ResistanceAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.ResistanceAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :resistance_affects, Equipment.list_resistance_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Resistance affect")
    |> assign(:resistance_affect, Equipment.get_resistance_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Resistance affect")
    |> assign(:resistance_affect, %ResistanceAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Resistance affects")
    |> assign(:resistance_affect, nil)
  end

  @impl true
  def handle_info(
        {IomdbExWeb.ResistanceAffectLive.FormComponent, {:saved, resistance_affect}},
        socket
      ) do
    {:noreply, stream_insert(socket, :resistance_affects, resistance_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    resistance_affect = Equipment.get_resistance_affect!(id)
    {:ok, _} = Equipment.delete_resistance_affect(resistance_affect)

    {:noreply, stream_delete(socket, :resistance_affects, resistance_affect)}
  end
end
