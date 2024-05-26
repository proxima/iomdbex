defmodule IomdbExWeb.WeaponDamageAffectLive.Index do
  use IomdbExWeb, :live_view

  alias IomdbEx.Equipment
  alias IomdbEx.Equipment.WeaponDamageAffect

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :weapon_damage_affects, Equipment.list_weapon_damage_affects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Weapon damage affect")
    |> assign(:weapon_damage_affect, Equipment.get_weapon_damage_affect!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Weapon damage affect")
    |> assign(:weapon_damage_affect, %WeaponDamageAffect{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Weapon damage affects")
    |> assign(:weapon_damage_affect, nil)
  end

  @impl true
  def handle_info(
        {IomdbExWeb.WeaponDamageAffectLive.FormComponent, {:saved, weapon_damage_affect}},
        socket
      ) do
    {:noreply, stream_insert(socket, :weapon_damage_affects, weapon_damage_affect)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    weapon_damage_affect = Equipment.get_weapon_damage_affect!(id)
    {:ok, _} = Equipment.delete_weapon_damage_affect(weapon_damage_affect)

    {:noreply, stream_delete(socket, :weapon_damage_affects, weapon_damage_affect)}
  end
end
