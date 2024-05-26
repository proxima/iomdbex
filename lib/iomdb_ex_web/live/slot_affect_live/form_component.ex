defmodule IomdbExWeb.SlotAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage slot_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="slot_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:value]} type="number" label="Value" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Slot affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{slot_affect: slot_affect} = assigns, socket) do
    changeset = Equipment.change_slot_affect(slot_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"slot_affect" => slot_affect_params}, socket) do
    changeset =
      socket.assigns.slot_affect
      |> Equipment.change_slot_affect(slot_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"slot_affect" => slot_affect_params}, socket) do
    save_slot_affect(socket, socket.assigns.action, slot_affect_params)
  end

  defp save_slot_affect(socket, :edit, slot_affect_params) do
    case Equipment.update_slot_affect(socket.assigns.slot_affect, slot_affect_params) do
      {:ok, slot_affect} ->
        notify_parent({:saved, slot_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Slot affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_slot_affect(socket, :new, slot_affect_params) do
    case Equipment.create_slot_affect(slot_affect_params) do
      {:ok, slot_affect} ->
        notify_parent({:saved, slot_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Slot affect created successfully")
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
