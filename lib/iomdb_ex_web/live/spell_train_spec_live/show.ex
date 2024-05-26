defmodule IomdbExWeb.SpellTrainSpecLive.Show do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guild

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:spell_train_spec, Guild.get_spell_train_spec!(id))}
  end

  defp page_title(:show), do: "Show Spell train spec"
  defp page_title(:edit), do: "Edit Spell train spec"
end
