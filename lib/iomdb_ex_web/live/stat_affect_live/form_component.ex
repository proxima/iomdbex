defmodule IomdbExWeb.StatAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage stat_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="stat_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:value]} type="number" label="Value" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Stat affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{stat_affect: stat_affect} = assigns, socket) do
    changeset = Equipment.change_stat_affect(stat_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"stat_affect" => stat_affect_params}, socket) do
    changeset =
      socket.assigns.stat_affect
      |> Equipment.change_stat_affect(stat_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"stat_affect" => stat_affect_params}, socket) do
    save_stat_affect(socket, socket.assigns.action, stat_affect_params)
  end

  defp save_stat_affect(socket, :edit, stat_affect_params) do
    case Equipment.update_stat_affect(socket.assigns.stat_affect, stat_affect_params) do
      {:ok, stat_affect} ->
        notify_parent({:saved, stat_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Stat affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_stat_affect(socket, :new, stat_affect_params) do
    case Equipment.create_stat_affect(stat_affect_params) do
      {:ok, stat_affect} ->
        notify_parent({:saved, stat_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Stat affect created successfully")
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
