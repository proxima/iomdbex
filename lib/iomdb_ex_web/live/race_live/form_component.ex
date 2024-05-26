defmodule IomdbExWeb.RaceLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Game

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage race records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="race-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:strength]} type="number" label="Strength" />
        <.input field={@form[:dexterity]} type="number" label="Dexterity" />
        <.input field={@form[:constitution]} type="number" label="Constitution" />
        <.input field={@form[:intelligence]} type="number" label="Intelligence" />
        <.input field={@form[:wisdom]} type="number" label="Wisdom" />
        <.input field={@form[:stamina]} type="number" label="Stamina" />
        <.input field={@form[:charisma]} type="number" label="Charisma" />
        <.input field={@form[:hpregen]} type="number" label="Hpregen" />
        <.input field={@form[:spregen]} type="number" label="Spregen" />
        <.input field={@form[:epregen]} type="number" label="Epregen" />
        <.input field={@form[:skill_max]} type="number" label="Skill max" />
        <.input field={@form[:spell_max]} type="number" label="Spell max" />
        <.input field={@form[:skill_rate]} type="number" label="Skill rate" />
        <.input field={@form[:spell_rate]} type="number" label="Spell rate" />
        <.input field={@form[:experience_rate]} type="number" label="Experience rate" />
        <.input field={@form[:need_dark_to_regen]} type="checkbox" label="Need dark to regen" />
        <.input field={@form[:need_light_to_regen]} type="checkbox" label="Need light to regen" />
        <.input field={@form[:corpse_eating]} type="checkbox" label="Corpse eating" />
        <.input field={@form[:average_height]} type="number" label="Average height" />
        <.input field={@form[:average_weight]} type="number" label="Average weight" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Race</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{race: race} = assigns, socket) do
    changeset = Game.change_race(race)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"race" => race_params}, socket) do
    changeset =
      socket.assigns.race
      |> Game.change_race(race_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"race" => race_params}, socket) do
    save_race(socket, socket.assigns.action, race_params)
  end

  defp save_race(socket, :edit, race_params) do
    case Game.update_race(socket.assigns.race, race_params) do
      {:ok, race} ->
        notify_parent({:saved, race})

        {:noreply,
         socket
         |> put_flash(:info, "Race updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_race(socket, :new, race_params) do
    case Game.create_race(race_params) do
      {:ok, race} ->
        notify_parent({:saved, race})

        {:noreply,
         socket
         |> put_flash(:info, "Race created successfully")
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
