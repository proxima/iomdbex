defmodule IomdbEx.Game.DamageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "damage_types" do
    field :name, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(damage_type, attrs) do
    damage_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
