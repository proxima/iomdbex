defmodule IomdbEx.GuildsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Guilds` context.
  """

  @doc """
  Generate a guild.
  """
  def guild_fixture(attrs \\ %{}) do
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
