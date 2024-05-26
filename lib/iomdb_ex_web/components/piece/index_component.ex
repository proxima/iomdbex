defmodule IomdbExWeb.Components.Piece.IndexComponent do
  use IomdbExWeb, :html

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <:subtitle>Equipment Pieces</:subtitle>
        <:actions>
          <.link
            patch={~p"/equipment_pieces/new?equipment_monster_id=#{@monster.id}"}
            phx-click={JS.push_focus()}
          >
            <.button>Add Equipment Piece</.button>
          </.link>
        </:actions>
      </.header>
      <.table id="equipment_pieces" rows={@monster.equipment_pieces}>
        <:col :let={piece} label="Name"><%= piece.name %></:col>
        <:col :let={piece} label="TP Value"><%= piece.tp_value %></:col>
      </.table>
    </div>
    """
  end
end
