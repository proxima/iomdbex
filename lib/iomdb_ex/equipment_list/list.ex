defmodule IomdbEx.EquipmentList.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_piece_lists" do
    field :name, :string
    belongs_to :admin_user, IomdbEx.Accounts.Admin
    belongs_to :equipment_piece_list_type, IomdbEx.EquipmentList.Type

    has_many :equipment_piece_list_entries, IomdbEx.EquipmentList.Entry,
      foreign_key: :equipment_piece_list_id

    has_many :equipment_pieces,
      through: [:equipment_piece_list_entries, :equipment_piece]

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :admin_user_id, :equipment_piece_list_type_id])
    |> validate_required([:name, :admin_user_id, :equipment_piece_list_type_id])
  end
end
