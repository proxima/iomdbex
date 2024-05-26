defmodule IomdbEx.Equipment.MonsterStrategy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_mob_strategies" do
    field :additional_prot_info, :string
    field :walkthrough, :string
    field :quest_mob, :boolean, default: false
    field :fight_notes, :string
    belongs_to :equipment_monster, IomdbEx.Equipment.Monster
    belongs_to :greater_tank_prot, IomdbEx.Game.DamageType
    belongs_to :lesser_tank_prot1, IomdbEx.Game.DamageType
    belongs_to :lesser_tank_prot2, IomdbEx.Game.DamageType
    belongs_to :greater_party_prot, IomdbEx.Game.DamageType
    belongs_to :lesser_party_prot1, IomdbEx.Game.DamageType
    belongs_to :lesser_party_prot2, IomdbEx.Game.DamageType

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(monster_strategy, attrs) do
    monster_strategy
    |> cast(attrs, [
      :additional_prot_info,
      :walkthrough,
      :quest_mob,
      :fight_notes,
      :equipment_monster_id,
      :greater_tank_prot_id,
      :lesser_tank_prod1_id,
      :lesser_tank_prot2_id,
      :greater_party_prot_id,
      :lesser_party_prot1_id,
      :lesser_party_prot2_id
    ])
    |> validate_required([:equipment_monster_id])
  end
end
