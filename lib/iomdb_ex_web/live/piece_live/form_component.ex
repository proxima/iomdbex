defmodule IomdbExWeb.PieceLive.FormComponent do
  use IomdbExWeb, :live_component

  alias IomdbEx.Equipment

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
        <.input field={@form[:klass]} type="number" label="Klass" />
        <.input field={@form[:weight]} type="number" label="Weight" />
        <.input field={@form[:special]} type="text" label="Special" />
        <.input field={@form[:tp_value]} type="number" label="Tp value" />
        <.input field={@form[:rufrin_price]} type="number" label="Rufrin price" />
        <.input
          field={@form[:equipment_monster_id]}
          type="select"
          label="Equipment Monster"
          options={Enum.map(Equipment.list_equipment_monsters(), &{&1.name, &1.id})}
        />
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
