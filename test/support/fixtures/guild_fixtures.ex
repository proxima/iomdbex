defmodule IomdbEx.GuildFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Guild` context.
  """

  @doc """
  Generate a spell.
  """
  def spell_fixture(attrs \\ %{}) do
    {:ok, spell} =
      attrs
      |> Enum.into(%{
        base_cost: 42,
        name: "some name"
      })
      |> IomdbEx.Guild.create_spell()

    spell
  end

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        base_cost: 42,
        name: "some name"
      })
      |> IomdbEx.Guild.create_skill()

    skill
  end

  @doc """
  Generate a guild_type.
  """
  def guild_type_fixture(attrs \\ %{}) do
    {:ok, guild_type} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Guild.create_guild_type()

    guild_type
  end

  @doc """
  Generate a skill_train_spec.
  """
  def skill_train_spec_fixture(attrs \\ %{}) do
    {:ok, skill_train_spec} =
      attrs
      |> Enum.into(%{
        level: 42,
        max: 42
      })
      |> IomdbEx.Guild.create_skill_train_spec()

    skill_train_spec
  end

  @doc """
  Generate a spell_train_spec.
  """
  def spell_train_spec_fixture(attrs \\ %{}) do
    {:ok, spell_train_spec} =
      attrs
      |> Enum.into(%{
        level: 42,
        max: 42
      })
      |> IomdbEx.Guild.create_spell_train_spec()

    spell_train_spec
  end
end
