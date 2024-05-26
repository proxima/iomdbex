defmodule IomdbExWeb.MonsterLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.Monster

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :equipment_monsters, Equipment.list_equipment_monsters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Monster")
    |> assign(:monster, Equipment.get_monster!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Monster")
    |> assign(:monster, %Monster{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Equipment monsters")
    |> assign(:monster, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.MonsterLive.FormComponent, {:saved, monster}}, socket) do
    {:noreply, stream_insert(socket, :equipment_monsters, monster)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    monster = Equipment.get_monster!(id)
    {:ok, _} = Equipment.delete_monster(monster)

    {:noreply, stream_delete(socket, :equipment_monsters, monster)}
  end
end
