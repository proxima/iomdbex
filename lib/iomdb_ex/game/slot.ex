defmodule IomdbEx.Game.Slot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slots" do
    field :name, :string
    field :abbreviation, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:name, :abbreviation])
    |> validate_required([:name, :abbreviation])
    |> unique_constraint([:name])
    |> unique_constraint([:abbreviation])
  end
end
