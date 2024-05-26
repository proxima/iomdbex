defmodule IomdbEx.Guild.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guild_types" do
    field :name, :string
    field :level, :integer

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(guild_type, attrs) do
    guild_type
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
    |> unique_constraint([:name])
    |> unique_constraint([:level])
  end
end
