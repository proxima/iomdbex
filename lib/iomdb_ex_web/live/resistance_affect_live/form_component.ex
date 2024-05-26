defmodule IomdbExWeb.ResistanceAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage resistance_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="resistance_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:value]} type="number" label="Value" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Resistance affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{resistance_affect: resistance_affect} = assigns, socket) do
    changeset = Equipment.change_resistance_affect(resistance_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"resistance_affect" => resistance_affect_params}, socket) do
    changeset =
      socket.assigns.resistance_affect
      |> Equipment.change_resistance_affect(resistance_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"resistance_affect" => resistance_affect_params}, socket) do
    save_resistance_affect(socket, socket.assigns.action, resistance_affect_params)
  end

  defp save_resistance_affect(socket, :edit, resistance_affect_params) do
    case Equipment.update_resistance_affect(
           socket.assigns.resistance_affect,
           resistance_affect_params
         ) do
      {:ok, resistance_affect} ->
        notify_parent({:saved, resistance_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Resistance affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_resistance_affect(socket, :new, resistance_affect_params) do
    case Equipment.create_resistance_affect(resistance_affect_params) do
      {:ok, resistance_affect} ->
        notify_parent({:saved, resistance_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Resistance affect created successfully")
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
