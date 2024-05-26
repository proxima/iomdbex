defmodule IomdbExWeb.MonsterStrategyLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:monster_strategy, Equipment.get_monster_strategy!(id))}
  end

  defp page_title(:show), do: "Show Monster strategy"
  defp page_title(:edit), do: "Edit Monster strategy"
end
