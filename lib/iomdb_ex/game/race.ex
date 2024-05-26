defmodule IomdbEx.Game.Race do
  use Ecto.Schema
  import Ecto.Changeset

  schema "races" do
    field :name, :string
    field :description, :string
    field :strength, :integer
    field :dexterity, :integer
    field :constitution, :integer
    field :intelligence, :integer
    field :wisdom, :integer
    field :stamina, :integer
    field :charisma, :integer
    field :hpregen, :integer
    field :spregen, :integer
    field :epregen, :integer
    field :skill_max, :integer
    field :spell_max, :integer
    field :skill_rate, :float
    field :spell_rate, :float
    field :experience_rate, :float
    field :need_dark_to_regen, :boolean, default: false
    field :need_light_to_regen, :boolean, default: false
    field :corpse_eating, :boolean, default: false
    field :average_height, :integer
    field :average_weight, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [
      :name,
      :strength,
      :dexterity,
      :constitution,
      :intelligence,
      :wisdom,
      :stamina,
      :charisma,
      :hpregen,
      :spregen,
      :epregen,
      :skill_max,
      :spell_max,
      :skill_rate,
      :spell_rate,
      :experience_rate,
      :need_dark_to_regen,
      :need_light_to_regen,
      :corpse_eating,
      :average_height,
      :average_weight,
      :description
    ])
    |> validate_required([
      :name,
      :strength,
      :dexterity,
      :constitution,
      :intelligence,
      :wisdom,
      :stamina,
      :charisma,
      :hpregen,
      :spregen,
      :epregen,
      :skill_max,
      :spell_max,
      :skill_rate,
      :spell_rate,
      :experience_rate,
      :need_dark_to_regen,
      :need_light_to_regen,
      :corpse_eating,
      :average_height,
      :average_weight,
      :description
    ])
    |> unique_constraint(:name)
  end
end
