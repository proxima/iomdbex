defmodule IomdbEx.EquipmentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Equipment` context.
  """

  @doc """
  Generate a armor_class_level.
  """
  def armor_class_level_fixture(attrs \\ %{}) do
    {:ok, armor_class_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Equipment.create_armor_class_level()

    armor_class_level
  end

  @doc """
  Generate a weapon_damage_level.
  """
  def weapon_damage_level_fixture(attrs \\ %{}) do
    {:ok, weapon_damage_level} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name"
      })
      |> IomdbEx.Equipment.create_weapon_damage_level()

    weapon_damage_level
  end

  @doc """
  Generate a monster.
  """
  def monster_fixture(attrs \\ %{}) do
    {:ok, monster} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> IomdbEx.Equipment.create_monster()

    monster
  end

  @doc """
  Generate a piece.
  """
  def piece_fixture(attrs \\ %{}) do
    monster = monster_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_monster_id: monster.id
      })

    {:ok, piece} =
      attrs
      |> Enum.into(%{
        klass: 42,
        name: "some name",
        rufrin_price: 42,
        special: "some special",
        tp_value: 7,
        weight: 42
      })
      |> IomdbEx.Equipment.create_piece()

    piece
  end

  @doc """
  Generate a monster_strategy.
  """
  def monster_strategy_fixture(attrs \\ %{}) do
    monster = monster_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_monster_id: monster.id
      })

    {:ok, monster_strategy} =
      attrs
      |> Enum.into(%{
        additional_prot_info: "some additional_prot_info",
        fight_notes: "some fight_notes",
        quest_mob: true,
        walkthrough: "some walkthrough"
      })
      |> IomdbEx.Equipment.create_monster_strategy()

    monster_strategy
  end
end
