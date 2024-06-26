defmodule IomdbExWeb.RaceLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Game

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:race, Game.get_race!(id))}
  end

  defp page_title(:show), do: "Show Race"
  defp page_title(:edit), do: "Edit Race"
end
