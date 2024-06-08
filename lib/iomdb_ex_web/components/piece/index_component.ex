defmodule IomdbExWeb.Components.Piece.IndexComponent do
  use IomdbExWeb, :html

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <:subtitle>Equipment Pieces</:subtitle>
        <:actions>
          <.link patch={patch_link(@owner)} phx-click={JS.push_focus()}>
            <.button class="">Add Equipment Piece</.button>
          </.link>
        </:actions>
      </.header>
      <.table id="equipment_pieces" rows={@owner.equipment_pieces}>
        <:col :let={piece} label="Name">
          <.link patch={~p"/equipment_pieces/#{piece.id}"} phx-click={JS.push_focus()}>
            <%= piece.name %>
          </.link>
        </:col>
        <:col :let={piece} label="TP Value"><%= piece.tp_value %></:col>
      </.table>
    </div>
    """
  end

  defp patch_link(%IomdbEx.Equipment.Monster{} = owner) do
    ~p"/equipment_pieces/new?equipment_monster_id=#{owner.id}"
  end

  defp patch_link(%IomdbEx.EquipmentList.List{} = owner) do
    ~p"/equipment_piece_list_entries/new?equipment_piece_list_id=#{owner.id}"
  end
end
