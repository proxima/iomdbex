defmodule IomdbEx.Guild.SpellTrainSpec do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spell_train_specs" do
    field :max, :integer
    field :level, :integer
    belongs_to :spell, Iomdb.Guild.Spell
    belongs_to :guild, IomdbEx.Guilds.Guild

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(spell_train_spec, attrs) do
    spell_train_spec
    |> cast(attrs, [:level, :max, :spell_id, :guild_id])
    |> validate_required([:level, :max, :spell_id, :guild_id])
  end
end
