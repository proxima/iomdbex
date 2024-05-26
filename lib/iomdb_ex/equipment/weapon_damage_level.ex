defmodule IomdbEx.Equipment.WeaponDamageLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_damage_levels" do
    field :name, :string
    field :level, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(weapon_damage_level, attrs) do
    weapon_damage_level
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
    |> unique_constraint([:name])
    |> unique_constraint([:level])
  end
end
