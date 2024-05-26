defmodule IomdbEx.Equipment.ArmorClassLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "armor_class_levels" do
    field :name, :string
    field :level, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(armor_class_level, attrs) do
    armor_class_level
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
    |> unique_constraint([:name])
    |> unique_constraint([:level])
  end
end
