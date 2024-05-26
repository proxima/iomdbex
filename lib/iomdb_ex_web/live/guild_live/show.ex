defmodule IomdbExWeb.GuildLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guilds

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:guild, Guilds.get_guild!(id))}
  end

  defp page_title(:show), do: "Show Guild"
  defp page_title(:edit), do: "Edit Guild"
end
