defmodule IomdbExWeb.MonsterStrategyLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.MonsterStrategy

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :equipment_mob_strategies, Equipment.list_equipment_mob_strategies())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Monster strategy")
    |> assign(:monster_strategy, Equipment.get_monster_strategy!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Monster strategy")
    |> assign(:monster_strategy, %MonsterStrategy{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Equipment mob strategies")
    |> assign(:monster_strategy, nil)
  end

  @impl true
  def handle_info(
        {IomdbExWeb.MonsterStrategyLive.FormComponent, {:saved, monster_strategy}},
        socket
      ) do
    {:noreply, stream_insert(socket, :equipment_mob_strategies, monster_strategy)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    monster_strategy = Equipment.get_monster_strategy!(id)
    {:ok, _} = Equipment.delete_monster_strategy(monster_strategy)

    {:noreply, stream_delete(socket, :equipment_mob_strategies, monster_strategy)}
  end
end
