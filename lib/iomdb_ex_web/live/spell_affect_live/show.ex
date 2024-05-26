defmodule IomdbExWeb.SpellAffectLive.Show do
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
     |> assign(:spell_affect, Equipment.get_spell_affect!(id))}
  end

  defp page_title(:show), do: "Show Spell affect"
  defp page_title(:edit), do: "Edit Spell affect"
end
