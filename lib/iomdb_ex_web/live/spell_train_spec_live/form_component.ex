defmodule IomdbExWeb.SpellTrainSpecLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Guild

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage spell_train_spec records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="spell_train_spec-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:level]} type="number" label="Level" />
        <.input field={@form[:max]} type="number" label="Max" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Spell train spec</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{spell_train_spec: spell_train_spec} = assigns, socket) do
    changeset = Guild.change_spell_train_spec(spell_train_spec)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"spell_train_spec" => spell_train_spec_params}, socket) do
    changeset =
      socket.assigns.spell_train_spec
      |> Guild.change_spell_train_spec(spell_train_spec_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"spell_train_spec" => spell_train_spec_params}, socket) do
    save_spell_train_spec(socket, socket.assigns.action, spell_train_spec_params)
  end

  defp save_spell_train_spec(socket, :edit, spell_train_spec_params) do
    case Guild.update_spell_train_spec(socket.assigns.spell_train_spec, spell_train_spec_params) do
      {:ok, spell_train_spec} ->
        notify_parent({:saved, spell_train_spec})

        {:noreply,
         socket
         |> put_flash(:info, "Spell train spec updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_spell_train_spec(socket, :new, spell_train_spec_params) do
    case Guild.create_spell_train_spec(spell_train_spec_params) do
      {:ok, spell_train_spec} ->
        notify_parent({:saved, spell_train_spec})

        {:noreply,
         socket
         |> put_flash(:info, "Spell train spec created successfully")
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
