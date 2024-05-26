defmodule IomdbExWeb.SpellTrainSpecLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Guild
  alias IomdbEx.Guild.SpellTrainSpec

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :spell_train_specs, Guild.list_spell_train_specs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Spell train spec")
    |> assign(:spell_train_spec, Guild.get_spell_train_spec!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Spell train spec")
    |> assign(:spell_train_spec, %SpellTrainSpec{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Spell train specs")
    |> assign(:spell_train_spec, nil)
  end

  @impl true
  def handle_info(
        {IomdbExWeb.SpellTrainSpecLive.FormComponent, {:saved, spell_train_spec}},
        socket
      ) do
    {:noreply, stream_insert(socket, :spell_train_specs, spell_train_spec)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    spell_train_spec = Guild.get_spell_train_spec!(id)
    {:ok, _} = Guild.delete_spell_train_spec(spell_train_spec)

    {:noreply, stream_delete(socket, :spell_train_specs, spell_train_spec)}
  end
end
