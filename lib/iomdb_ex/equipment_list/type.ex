defmodule IomdbEx.EquipmentList.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_piece_list_types" do
    field :name, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
