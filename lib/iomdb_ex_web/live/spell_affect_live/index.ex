defmodule IomdbExWeb.SpellAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.SpellAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :spell_affects, Equipment.list_spell_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Spell affect")
    |> assign(:spell_affect, Equipment.get_spell_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Spell affect")
    |> assign(:spell_affect, %SpellAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Spell affects")
    |> assign(:spell_affect, nil)
  end

  @impl true
  def handle_info({IomdbExWeb.SpellAffectLive.FormComponent, {:saved, spell_affect}}, socket) do
    {:noreply, stream_insert(socket, :spell_affects, spell_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    spell_affect = Equipment.get_spell_affect!(id)
    {:ok, _} = Equipment.delete_spell_affect(spell_affect)

    {:noreply, stream_delete(socket, :spell_affects, spell_affect)}
  end
end
