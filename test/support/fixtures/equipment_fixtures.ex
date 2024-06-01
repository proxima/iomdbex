defmodule IomdbEx.EquipmentFixtures do
  alias IomdbEx.{GameFixtures, GuildFixtures}

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

  @doc """
  Generate a resistance_affect.
  """
  def resistance_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    damage_type = GameFixtures.damage_type_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        damage_type_id: damage_type.id
      })

    {:ok, resistance_affect} =
      attrs
      |> Enum.into(%{
        value: 42
      })
      |> IomdbEx.Equipment.create_resistance_affect()

    resistance_affect
  end

  @doc """
  Generate a skill_affect.
  """
  def skill_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    skill = GuildFixtures.skill_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        skill_id: skill.id
      })

    {:ok, skill_affect} =
      attrs
      |> Enum.into(%{
        value: 42
      })
      |> IomdbEx.Equipment.create_skill_affect()

    skill_affect
  end

  @doc """
  Generate a spell_affect.
  """
  def spell_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    spell = GuildFixtures.spell_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        spell_id: spell.id
      })

    {:ok, spell_affect} =
      attrs
      |> Enum.into(%{
        value: 42
      })
      |> IomdbEx.Equipment.create_spell_affect()

    spell_affect
  end

  @doc """
  Generate a slot_affect.
  """
  def slot_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    slot = GameFixtures.slot_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        slot_id: slot.id
      })

    {:ok, slot_affect} =
      attrs
      |> Enum.into(%{
        value: 42
      })
      |> IomdbEx.Equipment.create_slot_affect()

    slot_affect
  end

  @doc """
  Generate a stat_affect.
  """
  def stat_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    stat = GameFixtures.stat_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        stat_id: stat.id
      })

    {:ok, stat_affect} =
      attrs
      |> Enum.into(%{
        value: 42
      })
      |> IomdbEx.Equipment.create_stat_affect()

    stat_affect
  end

  @doc """
  Generate a weapon_damage_affect.
  """
  def weapon_damage_affect_fixture(attrs \\ %{}) do
    piece = piece_fixture()
    weapon_damage_level = weapon_damage_level_fixture()
    damage_type = GameFixtures.damage_type_fixture()

    attrs =
      Map.merge(attrs, %{
        equipment_piece_id: piece.id,
        weapon_damage_level_id: weapon_damage_level.id,
        damage_type_id: damage_type.id
      })

    {:ok, weapon_damage_affect} =
      attrs
      |> Enum.into(%{})
      |> IomdbEx.Equipment.create_weapon_damage_affect()

    weapon_damage_affect
  end
end
