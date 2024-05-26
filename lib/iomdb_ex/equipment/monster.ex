defmodule IomdbEx.Equipment.Monster do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_monsters" do
    field :name, :string
    has_many :equipment_pieces, IomdbEx.Equipment.Piece, foreign_key: :equipment_monster_id

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(monster, attrs) do
    monster
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
