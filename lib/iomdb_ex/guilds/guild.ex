defmodule IomdbEx.Guilds.Guild do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guilds" do
    field :name, :string
    field :location, :string
    field :levels, :integer
    belongs_to :guild_type, IomdbEx.Guild.Type

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(guild, attrs) do
    guild
    |> cast(attrs, [:name, :location, :levels, :guild_type_id])
    |> validate_required([:name, :location, :levels, :guild_type_id])
    |> validate_number(:levels,
      greater_than_or_equal_to: 1,
      message: "Enter a number one or greater"
    )
    |> unique_constraint(:name)
  end
end
