defmodule IomdbExWeb.SkillTrainSpecLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Guild

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage skill_train_spec records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="skill_train_spec-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:level]} type="number" label="Level" />
        <.input field={@form[:max]} type="number" label="Max" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Skill train spec</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{skill_train_spec: skill_train_spec} = assigns, socket) do
    changeset = Guild.change_skill_train_spec(skill_train_spec)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"skill_train_spec" => skill_train_spec_params}, socket) do
    changeset =
      socket.assigns.skill_train_spec
      |> Guild.change_skill_train_spec(skill_train_spec_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"skill_train_spec" => skill_train_spec_params}, socket) do
    save_skill_train_spec(socket, socket.assigns.action, skill_train_spec_params)
  end

  defp save_skill_train_spec(socket, :edit, skill_train_spec_params) do
    case Guild.update_skill_train_spec(socket.assigns.skill_train_spec, skill_train_spec_params) do
      {:ok, skill_train_spec} ->
        notify_parent({:saved, skill_train_spec})

        {:noreply,
         socket
         |> put_flash(:info, "Skill train spec updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_skill_train_spec(socket, :new, skill_train_spec_params) do
    case Guild.create_skill_train_spec(skill_train_spec_params) do
      {:ok, skill_train_spec} ->
        notify_parent({:saved, skill_train_spec})

        {:noreply,
         socket
         |> put_flash(:info, "Skill train spec created successfully")
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
