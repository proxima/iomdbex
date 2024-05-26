defmodule IomdbExWeb.MonsterStrategyLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage monster_strategy records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="monster_strategy-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:additional_prot_info]} type="text" label="Additional prot info" />
        <.input field={@form[:walkthrough]} type="text" label="Walkthrough" />
        <.input field={@form[:quest_mob]} type="checkbox" label="Quest mob" />
        <.input field={@form[:fight_notes]} type="text" label="Fight notes" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Monster strategy</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{monster_strategy: monster_strategy} = assigns, socket) do
    changeset = Equipment.change_monster_strategy(monster_strategy)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"monster_strategy" => monster_strategy_params}, socket) do
    changeset =
      socket.assigns.monster_strategy
      |> Equipment.change_monster_strategy(monster_strategy_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"monster_strategy" => monster_strategy_params}, socket) do
    save_monster_strategy(socket, socket.assigns.action, monster_strategy_params)
  end

  defp save_monster_strategy(socket, :edit, monster_strategy_params) do
    case Equipment.update_monster_strategy(
           socket.assigns.monster_strategy,
           monster_strategy_params
         ) do
      {:ok, monster_strategy} ->
        notify_parent({:saved, monster_strategy})

        {:noreply,
         socket
         |> put_flash(:info, "Monster strategy updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_monster_strategy(socket, :new, monster_strategy_params) do
    case Equipment.create_monster_strategy(monster_strategy_params) do
      {:ok, monster_strategy} ->
        notify_parent({:saved, monster_strategy})

        {:noreply,
         socket
         |> put_flash(:info, "Monster strategy created successfully")
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
