defmodule IomdbExWeb.Components.Piece.AffectsFormComponent do
  use IomdbExWeb, :html

  def render(assigns) do
    ~H"""
    <.inputs_for :let={inner_form} field={@form[@relation]}>
      <input type="hidden" name="piece[#{@relation}_sort][]" value={inner_form.index} />
      <.input type="hidden" field={inner_form[:equipment_piece_id]} value={@form.data.id} />

      <.input
        field={inner_form[:stat_id]}
        type="select"
        label={@dropdown_title}
        options={Enum.map(@dropdown_fn.(), &{&1.name, &1.id})}
      >
        <:label_action>
          <button
            type="button"
            name="piece[#{@relation}_drop][]"
            value={inner_form.index}
            phx-click={JS.dispatch("change")}
          >
            <.icon
              name="hero-x-mark"
              class="w-6 h-6 relative bg-red-500 hover:bg-red-700 hover:cursor-pointer"
            />
          </button>
        </:label_action>
      </.input>
      <.input :if={@value} field={inner_form[:value]} type="number" label="Value" />
    </.inputs_for>

    <input type="hidden" name="piece[#{@relation}_drop][]" />

    <.button
      type="button"
      name="piece[#{@relation}_sort][]"
      value="new"
      phx-click={JS.dispatch("change")}
    >
      <.icon name="hero-plus" class="h-3 w-3" />Stat
    </.button>
    """
  end
end
