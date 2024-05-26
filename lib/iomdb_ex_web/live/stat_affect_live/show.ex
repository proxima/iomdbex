defmodule IomdbExWeb.StatAffectLive.Show do
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
     |> assign(:stat_affect, Equipment.get_stat_affect!(id))}
  end

  defp page_title(:show), do: "Show Stat affect"
  defp page_title(:edit), do: "Edit Stat affect"
end
