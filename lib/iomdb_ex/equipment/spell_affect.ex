defmodule IomdbEx.Equipment.SpellAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spell_affects" do
    field :value, :integer
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :spell, IomdbEx.Guild.Spell

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(spell_affect, attrs) do
    spell_affect
    |> cast(attrs, [:value, :equipment_piece_id, :spell_id])
    |> validate_required([:value, :equipment_piece_id, :spell_id])
    |> unique_constraint([:equipment_piece_id, :spell_id])
  end
end
