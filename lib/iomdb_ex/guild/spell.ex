defmodule IomdbEx.Guild.Spell do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spells" do
    field :name, :string
    field :base_cost, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(spell, attrs) do
    spell
    |> cast(attrs, [:name, :base_cost])
    |> validate_required([:name, :base_cost])
    |> unique_constraint([:name])
  end
end
