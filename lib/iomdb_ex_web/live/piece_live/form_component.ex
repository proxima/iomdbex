defmodule IomdbExWeb.PieceLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.{Equipment, Game, Guild}

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage piece records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="piece-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input
          field={@form[:equipment_monster_id]}
          type="select"
          label="Equipment Monster"
          options={Enum.map(Equipment.list_equipment_monsters(), &{&1.name, &1.id})}
        />
        <.input field={@form[:tp_value]} type="number" label="Tp value" phx-debounce="blur" />
        <.input field={@form[:special]} type="text" label="Special" />
        <.input field={@form[:klass]} type="number" label="Class" />
        <.input field={@form[:weight]} type="number" label="Weight" />
        <.input field={@form[:rufrin_price]} type="number" label="Rufrin price" />

        <%= if @action == :edit do %>
          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:slot_affects}
            dropdown_id={:slot_id}
            dropdown_title="Slot"
            dropdown_fn={&Game.list_slots/0}
            value={false}
            }
          />

          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:stat_affects}
            dropdown_id={:stat_id}
            dropdown_title="Stat"
            dropdown_fn={&Game.list_stats/0}
            value={true}
          />

          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:skill_affects}
            dropdown_id={:skill_id}
            dropdown_title="Skill"
            dropdown_fn={&Guild.list_skills/0}
            value={true}
          />

          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:spell_affects}
            dropdown_id={:spell_id}
            dropdown_title="Spell"
            dropdown_fn={&Guild.list_spells/0}
            value={true}
          />

          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:resistance_affects}
            dropdown_id={:damage_type_id}
            dropdown_title="Resistance"
            dropdown_fn={&Game.list_damage_types/0}
            value={true}
          />

          <IomdbExWeb.Components.Piece.AffectsFormComponent.render
            form={@form}
            relation={:weapon_damage_affects}
            dropdown_id={:damage_type_id}
            dropdown_title="Damage Type"
            dropdown_fn={&Game.list_damage_types/0}
            value={false}
          />
        <% end %>

        <:actions>
          <.button phx-disable-with="Saving...">Save Piece</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{piece: piece} = assigns, socket) do
    changeset = Equipment.change_piece(piece)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"piece" => piece_params}, socket) do
    changeset =
      socket.assigns.piece
      |> Equipment.change_piece(piece_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"piece" => piece_params}, socket) do
    save_piece(socket, socket.assigns.action, piece_params)
  end

  defp save_piece(socket, :edit, piece_params) do
    case Equipment.update_piece(socket.assigns.piece, piece_params) do
      {:ok, piece} ->
        notify_parent({:saved, piece})

        {:noreply,
         socket
         |> put_flash(:info, "Piece updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_piece(socket, :new, piece_params) do
    case Equipment.create_piece(piece_params) do
      {:ok, piece} ->
        notify_parent({:saved, piece})

        {:noreply,
         socket
         |> put_flash(:info, "Piece created successfully")
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
