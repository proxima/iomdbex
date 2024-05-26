defmodule IomdbEx.EquipmentList.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_piece_list_entries" do
    field :dicer, :string
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece
    belongs_to :equipment_piece_list, IomdbEx.EquipmentList.List

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:dicer, :equipment_piece_id, :equipment_piece_list_id])
    |> validate_required([:equipment_piece_id, :equipment_piece_list_id])
  end
end
