defmodule IomdbExWeb.GuildLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guilds
  alias IomdbEx.Guilds.Guild

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :guilds, Guilds.list_guilds())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Guild")
    |> assign(:guild, Guilds.get_guild!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Guild")
    |> assign(:guild, %Guild{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Guilds")
    |> assign(:guild, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.GuildLive.FormComponent, {:saved, guild}}, socket) do
    {:noreply, stream_insert(socket, :guilds, guild)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    guild = Guilds.get_guild!(id)
    {:ok, _} = Guilds.delete_guild(guild)

    {:noreply, stream_delete(socket, :guilds, guild)}
  end
end
