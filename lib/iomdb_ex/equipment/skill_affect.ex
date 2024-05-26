defmodule IomdbEx.Equipment.SkillAffect do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skill_affects" do
    field :value, :integer
    belongs_to :equipment_piece, IomdbEx.Equipment.Piece, foreign_key: :equipment_piece_id
    belongs_to :skill, IomdbEx.Guild.Skill

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(skill_affect, attrs) do
    skill_affect
    |> cast(attrs, [:value, :equipment_piece_id, :skill_id])
    |> validate_required([:value, :equipment_piece_id, :skill_id])
    |> unique_constraint([:equipment_piece_id, :skill_id])
  end
end
