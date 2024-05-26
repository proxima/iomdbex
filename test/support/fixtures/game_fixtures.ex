defmodule IomdbEx.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Game` context.
  """

  @doc """
  Generate a damage_level.
  """
  def damage_level_fixture(attrs \\ %{}) do
    {:ok, damage_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Game.create_damage_level()

    damage_level
  end

  @doc """
  Generate a alignment_level.
  """
  def alignment_level_fixture(attrs \\ %{}) do
    {:ok, alignment_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Game.create_alignment_level()

    alignment_level
  end

  @doc """
  Generate a damage_type.
  """
  def damage_type_fixture(attrs \\ %{}) do
    {:ok, damage_type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> IomdbEx.Game.create_damage_type()

    damage_type
  end

  @doc """
  Generate a hunger_level.
  """
  def hunger_level_fixture(attrs \\ %{}) do
    {:ok, hunger_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Game.create_hunger_level()

    hunger_level
  end

  @doc """
  Generate a stat.
  """
  def stat_fixture(attrs \\ %{}) do
    {:ok, stat} =
      attrs
      |> Enum.into(%{
        abbreviation: "some abbreviation",
        name: "some name"
      })
      |> IomdbEx.Game.create_stat()

    stat
  end

  @doc """
  Generate a slot.
  """
  def slot_fixture(attrs \\ %{}) do
    {:ok, slot} =
      attrs
      |> Enum.into(%{
        abbreviation: "some abbreviation",
        name: "some name"
      })
      |> IomdbEx.Game.create_slot()

    slot
  end

  @doc """
  Generate a stat_level.
  """
  def stat_level_fixture(attrs \\ %{}) do
    {:ok, stat_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Game.create_stat_level()

    stat_level
  end

  @doc """
  Generate a race.
  """
  def race_fixture(attrs \\ %{}) do
    {:ok, race} =
      attrs
      |> Enum.into(%{
        average_height: 42,
        average_weight: 42,
        charisma: 42,
        constitution: 42,
        corpse_eating: true,
        description: "some description",
        dexterity: 42,
        epregen: 42,
        experience_rate: 42.0,
        hpregen: 42,
        intelligence: 42,
        name: "some name",
        need_dark_to_regen: true,
        need_light_to_regen: true,
        skill_max: 42,
        skill_rate: 42.0,
        spell_max: 42,
        spell_rate: 42.0,
        spregen: 42,
        stamina: 42,
        strength: 42,
        wisdom: 42
      })
      |> IomdbEx.Game.create_race()

    race
  end
end
