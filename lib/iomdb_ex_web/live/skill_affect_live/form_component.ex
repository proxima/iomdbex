defmodule IomdbExWeb.SkillAffectLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage skill_affect records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="skill_affect-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:value]} type="number" label="Value" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Skill affect</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{skill_affect: skill_affect} = assigns, socket) do
    changeset = Equipment.change_skill_affect(skill_affect)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"skill_affect" => skill_affect_params}, socket) do
    changeset =
      socket.assigns.skill_affect
      |> Equipment.change_skill_affect(skill_affect_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"skill_affect" => skill_affect_params}, socket) do
    save_skill_affect(socket, socket.assigns.action, skill_affect_params)
  end

  defp save_skill_affect(socket, :edit, skill_affect_params) do
    case Equipment.update_skill_affect(socket.assigns.skill_affect, skill_affect_params) do
      {:ok, skill_affect} ->
        notify_parent({:saved, skill_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Skill affect updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_skill_affect(socket, :new, skill_affect_params) do
    case Equipment.create_skill_affect(skill_affect_params) do
      {:ok, skill_affect} ->
        notify_parent({:saved, skill_affect})

        {:noreply,
         socket
         |> put_flash(:info, "Skill affect created successfully")
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
