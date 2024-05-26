defmodule IomdbEx.Equipment.ResistanceAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "resistance_affects" do
    field :value, :integer
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :damage_type, IomdbEx.Game.DamageType

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(resistance_affect, attrs) do
    resistance_affect
    |> cast(attrs, [:value, :equipment_piece_id, :damage_type_id])
    |> validate_required([:value, :equipment_piece_id, :damage_type_id])
    |> unique_constraint([:equipment_piece_id, :damage_type_id])
  end
end
