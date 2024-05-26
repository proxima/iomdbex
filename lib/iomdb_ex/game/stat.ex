defmodule IomdbEx.Game.Stat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stats" do
    field :name, :string
    field :abbreviation, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(stat, attrs) do
    stat
    |> cast(attrs, [:name, :abbreviation])
    |> validate_required([:name, :abbreviation])
    |> unique_constraint([:name])
    |> unique_constraint([:abbreviation])
  end
end
