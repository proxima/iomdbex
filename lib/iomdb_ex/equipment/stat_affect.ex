defmodule IomdbEx.Equipment.StatAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stat_affects" do
    field :value, :integer
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :stat, IomdbEx.Game.Stat

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(stat_affect, attrs) do
    stat_affect
    |> cast(attrs, [:value, :equipment_piece_id, :stat_id])
    |> validate_required([:value, :equipment_piece_id, :stat_id])
    |> unique_constraint([:equipment_piece_id, :stat_id])
  end
end
