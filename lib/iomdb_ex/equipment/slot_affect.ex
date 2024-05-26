defmodule IomdbEx.Equipment.SlotAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slot_affects" do
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :slot, IomdbEx.Game.Slot

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(slot_affect, attrs) do
    slot_affect
    |> cast(attrs, [:equipment_piece_id, :slot_id])
    |> validate_required([:equipment_piece_id, :slot_id])
    |> unique_constraint([:equipment_piece_id, :slot_id])
  end
end
