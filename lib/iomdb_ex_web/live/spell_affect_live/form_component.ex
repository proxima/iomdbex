defmodule IomdbExWeb.SpellAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage spell_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="spell_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:value]} type="number" label="Value" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Spell affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{spell_affect: spell_affect} = assigns, socket) do
    changeset = Equipment.change_spell_affect(spell_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"spell_affect" => spell_affect_params}, socket) do
    changeset =
      socket.assigns.spell_affect
      |> Equipment.change_spell_affect(spell_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"spell_affect" => spell_affect_params}, socket) do
    save_spell_affect(socket, socket.assigns.action, spell_affect_params)
  end

  defp save_spell_affect(socket, :edit, spell_affect_params) do
    case Equipment.update_spell_affect(socket.assigns.spell_affect, spell_affect_params) do
      {:ok, spell_affect} ->
        notify_parent({:saved, spell_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Spell affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_spell_affect(socket, :new, spell_affect_params) do
    case Equipment.create_spell_affect(spell_affect_params) do
      {:ok, spell_affect} ->
        notify_parent({:saved, spell_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Spell affect created successfully")
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
