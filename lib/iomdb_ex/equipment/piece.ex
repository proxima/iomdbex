defmodule IomdbEx.Equipment.Piece do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipment_pieces" do
    field :name, :string
    field :special, :string
    field :klass, :integer
    field :weight, :integer
    field :tp_value, :integer
    field :rufrin_price, :integer

    belongs_to :equipment_monster, IomdbEx.Equipment.Monster

    has_many :skill_affects, IomdbEx.Equipment.SkillAffect, foreign_key: :equipment_piece_id

    has_many :slot_affects, IomdbEx.Equipment.SlotAffect,
      foreign_key: :equipment_piece_id,
      on_replace: :delete

    has_many :spell_affects, IomdbEx.Equipment.SpellAffect, foreign_key: :equipment_piece_id
    has_many :stat_affects, IomdbEx.Equipment.StatAffect, foreign_key: :equipment_piece_id

    has_many :resistance_affects, IomdbEx.Equipment.ResistanceAffect,
      foreign_key: :equipment_piece_id

    has_many :weapon_damage_affects, IomdbEx.Equipment.WeaponDamageAffect,
      foreign_key: :equipment_piece_id

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(piece, attrs) do
    piece
    |> cast(attrs, [
      :name,
      :klass,
      :weight,
      :special,
      :tp_value,
      :rufrin_price,
      :equipment_monster_id
    ])
    |> validate_required([:name, :equipment_monster_id])
    |> validate_number(:klass,
      greater_than_or_equal_to: 0,
      message: "Enter a number zero or greater"
    )
    |> validate_number(:weight,
      greater_than_or_equal_to: 0,
      message: "Enter a number zero or greater"
    )
    |> validate_inclusion(:tp_value, 0..10, message: "TP values range 1 through 10")
    |> validate_number(:rufrin_price,
      greater_than_or_equal_to: 0,
      message: "Enter a number zero or greater"
    )
    |> cast_assoc(:skill_affects)
    |> cast_assoc(:slot_affects,
      sort_param: :slot_affects_sort,
      drop_param: :slot_affects_drop
    )
    |> cast_assoc(:spell_affects)
    |> cast_assoc(:stat_affects)
    |> cast_assoc(:resistance_affects)
    |> cast_assoc(:weapon_damage_affects)
  end
end
