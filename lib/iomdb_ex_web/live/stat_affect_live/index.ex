defmodule IomdbExWeb.StatAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.StatAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :stat_affects, Equipment.list_stat_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Stat affect")
    |> assign(:stat_affect, Equipment.get_stat_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Stat affect")
    |> assign(:stat_affect, %StatAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Stat affects")
    |> assign(:stat_affect, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.StatAffectLive.FormComponent, {:saved, stat_affect}}, socket) do
    {:noreply, stream_insert(socket, :stat_affects, stat_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    stat_affect = Equipment.get_stat_affect!(id)
    {:ok, _} = Equipment.delete_stat_affect(stat_affect)

    {:noreply, stream_delete(socket, :stat_affects, stat_affect)}
  end
end
