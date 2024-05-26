defmodule IomdbExWeb.RaceLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Game
  alias IomdbEx.Game.Race

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :races, Game.list_races())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Race")
    |> assign(:race, Game.get_race!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Race")
    |> assign(:race, %Race{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Races")
    |> assign(:race, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.RaceLive.FormComponent, {:saved, race}}, socket) do
    {:noreply, stream_insert(socket, :races, race)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    race = Game.get_race!(id)
    {:ok, _} = Game.delete_race(race)

    {:noreply, stream_delete(socket, :races, race)}
  end
end
