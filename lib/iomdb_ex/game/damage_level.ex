defmodule IomdbEx.Game.DamageLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "damage_levels" do
    field :name, :string
    field :level, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(damage_level, attrs) do
    damage_level
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
    |> unique_constraint([:name])
    |> unique_constraint([:level])
  end
end
