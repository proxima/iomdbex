defmodule IomdbEx.Guild.SkillTrainSpec do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skill_train_specs" do
    field :max, :integer
    field :level, :integer
    belongs_to :skill, Iomdb.Guild.Skill
    belongs_to :guild, IomdbEx.Guilds.Guild

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(skill_train_spec, attrs) do
    skill_train_spec
    |> cast(attrs, [:level, :max, :skill_id, :guild_id])
    |> validate_required([:level, :max, :skill_id, :guild_id])
  end
end
