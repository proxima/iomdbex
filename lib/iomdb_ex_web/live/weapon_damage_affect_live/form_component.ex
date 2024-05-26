defmodule IomdbExWeb.WeaponDamageAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage weapon_damage_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="weapon_damage_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <:actions>
          <.button phx-disable-with="Saving...">Save Weapon damage affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{weapon_damage_affect: weapon_damage_affect} = assigns, socket) do
    changeset = Equipment.change_weapon_damage_affect(weapon_damage_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"weapon_damage_affect" => weapon_damage_affect_params}, socket) do
    changeset =
      socket.assigns.weapon_damage_affect
      |> Equipment.change_weapon_damage_affect(weapon_damage_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"weapon_damage_affect" => weapon_damage_affect_params}, socket) do
    save_weapon_damage_affect(socket, socket.assigns.action, weapon_damage_affect_params)
  end

  defp save_weapon_damage_affect(socket, :edit, weapon_damage_affect_params) do
    case Equipment.update_weapon_damage_affect(
           socket.assigns.weapon_damage_affect,
           weapon_damage_affect_params
         ) do
      {:ok, weapon_damage_affect} ->
        notify_parent({:saved, weapon_damage_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Weapon damage affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_weapon_damage_affect(socket, :new, weapon_damage_affect_params) do
    case Equipment.create_weapon_damage_affect(weapon_damage_affect_params) do
      {:ok, weapon_damage_affect} ->
        notify_parent({:saved, weapon_damage_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Weapon damage affect created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
