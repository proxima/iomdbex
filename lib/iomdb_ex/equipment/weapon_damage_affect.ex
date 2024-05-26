defmodule IomdbEx.Equipment.WeaponDamageAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_damage_affects" do
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :weapon_damage_level, IomdbEx.Equipment.WeaponDamageLevel
    belongs_to :damage_type, IomdbEx.Game.DamageType

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(weapon_damage_affect, attrs) do
    weapon_damage_affect
    |> cast(attrs, [:equipment_piece_id, :weapon_damage_level_id, :damage_type_id])
    |> validate_required([:equipment_piece_id, :weapon_damage_level_id, :damage_type_id])
    |> unique_constraint([:equipment_piece_id, :weapon_damage_level_id, :damage_type_id])
  end
end
