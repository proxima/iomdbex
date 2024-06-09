defmodule IomdbExWeb.Components.Piece.SlotAffectsFormComponent do
  use IomdbExWeb, :html

  alias IomdbEx.Game

  def render(assigns) do
    ~H"""
    <% # Slots %>
    <.inputs_for :let={slot_f} field={@form[:slot_affects]}>
      <input type="hidden" name="piece[slot_affects_sort][]" value={slot_f.index} />
      <.input type="hidden" field={slot_f[:equipment_piece_id]} value={@form.data.id} />

      <.input
        field={slot_f[:slot_id]}
        type="select"
        label="Slot"
        options={Enum.map(Game.list_slots(), &{&1.name, &1.id})}
      >
        <:label_action>
          <button
            type="button"
            name="piece[slot_affects_drop][]"
            value={slot_f.index}
            phx-click={JS.dispatch("change")}
          >
            <.icon
              name="hero-x-mark"
              class="w-6 h-6 relative bg-red-500 hover:bg-red-700 hover:cursor-pointer"
            />
          </button>
        </:label_action>
      </.input>
    </.inputs_for>

    <input type="hidden" name="piece[slot_affects_drop][]" />

    <.button
      type="button"
      name="piece[slot_affects_sort][]"
      value="new"
      phx-click={JS.dispatch("change")}
    >
      <.icon name="hero-plus" class="h-3 w-3" />Slot
    </.button>
    """
  end
end
