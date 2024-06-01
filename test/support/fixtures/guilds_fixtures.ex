defmodule IomdbEx.GuildsFixtures do
  alias IomdbEx.GuildFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Guilds` context.
  """

  @doc """
  Generate a guild.
  """
  def guild_fixture(attrs \\ %{}) do
    guild_type = GuildFixtures.guild_type_fixture()

    attrs = Map.merge(attrs, %{guild_type_id: guild_type.id})

    {:ok, guild} =
      attrs
      |> Enum.into(%{
        levels: 42,
        location: "some location",
        name: "some name"
      })
      |> IomdbEx.Guilds.create_guild()

    guild
  end
end
