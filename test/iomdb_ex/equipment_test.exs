defmodule IomdbEx.EquipmentTest do
  use IomdbEx.DataCase

  alias IomdbEx.Equipment

  describe "armor_class_levels" do
    alias IomdbEx.Equipment.ArmorClassLevel

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_armor_class_levels/0 returns all armor_class_levels" do
      armor_class_level = armor_class_level_fixture()
      assert Equipment.list_armor_class_levels() == [armor_class_level]
    end

    test "get_armor_class_level!/1 returns the armor_class_level with given id" do
      armor_class_level = armor_class_level_fixture()
      assert Equipment.get_armor_class_level!(armor_class_level.id) == armor_class_level
    end

    test "create_armor_class_level/1 with valid data creates a armor_class_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %ArmorClassLevel{} = armor_class_level} =
               Equipment.create_armor_class_level(valid_attrs)

      assert armor_class_level.name == "some name"
      assert armor_class_level.level == 42
    end

    test "create_armor_class_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_armor_class_level(@invalid_attrs)
    end

    test "update_armor_class_level/2 with valid data updates the armor_class_level" do
      armor_class_level = armor_class_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %ArmorClassLevel{} = armor_class_level} =
               Equipment.update_armor_class_level(armor_class_level, update_attrs)

      assert armor_class_level.name == "some updated name"
      assert armor_class_level.level == 43
    end

    test "update_armor_class_level/2 with invalid data returns error changeset" do
      armor_class_level = armor_class_level_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_armor_class_level(armor_class_level, @invalid_attrs)

      assert armor_class_level == Equipment.get_armor_class_level!(armor_class_level.id)
    end

    test "delete_armor_class_level/1 deletes the armor_class_level" do
      armor_class_level = armor_class_level_fixture()
      assert {:ok, %ArmorClassLevel{}} = Equipment.delete_armor_class_level(armor_class_level)

      assert_raise Ecto.NoResultsError, fn ->
        Equipment.get_armor_class_level!(armor_class_level.id)
      end
    end

    test "change_armor_class_level/1 returns a armor_class_level changeset" do
      armor_class_level = armor_class_level_fixture()
      assert %Ecto.Changeset{} = Equipment.change_armor_class_level(armor_class_level)
    end
  end

  describe "weapon_damage_levels" do
    alias IomdbEx.Equipment.WeaponDamageLevel

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_weapon_damage_levels/0 returns all weapon_damage_levels" do
      weapon_damage_level = weapon_damage_level_fixture()
      assert Equipment.list_weapon_damage_levels() == [weapon_damage_level]
    end

    test "get_weapon_damage_level!/1 returns the weapon_damage_level with given id" do
      weapon_damage_level = weapon_damage_level_fixture()
      assert Equipment.get_weapon_damage_level!(weapon_damage_level.id) == weapon_damage_level
    end

    test "create_weapon_damage_level/1 with valid data creates a weapon_damage_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %WeaponDamageLevel{} = weapon_damage_level} =
               Equipment.create_weapon_damage_level(valid_attrs)

      assert weapon_damage_level.name == "some name"
      assert weapon_damage_level.level == 42
    end

    test "create_weapon_damage_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_weapon_damage_level(@invalid_attrs)
    end

    test "update_weapon_damage_level/2 with valid data updates the weapon_damage_level" do
      weapon_damage_level = weapon_damage_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %WeaponDamageLevel{} = weapon_damage_level} =
               Equipment.update_weapon_damage_level(weapon_damage_level, update_attrs)

      assert weapon_damage_level.name == "some updated name"
      assert weapon_damage_level.level == 43
    end

    test "update_weapon_damage_level/2 with invalid data returns error changeset" do
      weapon_damage_level = weapon_damage_level_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_weapon_damage_level(weapon_damage_level, @invalid_attrs)

      assert weapon_damage_level == Equipment.get_weapon_damage_level!(weapon_damage_level.id)
    end

    test "delete_weapon_damage_level/1 deletes the weapon_damage_level" do
      weapon_damage_level = weapon_damage_level_fixture()

      assert {:ok, %WeaponDamageLevel{}} =
               Equipment.delete_weapon_damage_level(weapon_damage_level)

      assert_raise Ecto.NoResultsError, fn ->
        Equipment.get_weapon_damage_level!(weapon_damage_level.id)
      end
    end

    test "change_weapon_damage_level/1 returns a weapon_damage_level changeset" do
      weapon_damage_level = weapon_damage_level_fixture()
      assert %Ecto.Changeset{} = Equipment.change_weapon_damage_level(weapon_damage_level)
    end
  end

  describe "equipment_monsters" do
    alias IomdbEx.Equipment.Monster
    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{name: nil}

    test "list_equipment_monsters/0 returns all equipment_monsters" do
      monster = monster_fixture()
      assert Equipment.list_equipment_monsters() == [monster]
    end

    test "get_monster!/1 returns the monster with given id" do
      monster = monster_fixture()
      db_monster = Equipment.get_monster!(monster.id)

      assert monster.id == db_monster.id
      assert monster.name == db_monster.name
    end

    test "create_monster/1 with valid data creates a monster" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Monster{} = monster} = Equipment.create_monster(valid_attrs)
      assert monster.name == "some name"
    end

    test "create_monster/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_monster(@invalid_attrs)
    end

    test "update_monster/2 with valid data updates the monster" do
      monster = monster_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Monster{} = monster} = Equipment.update_monster(monster, update_attrs)
      assert monster.name == "some updated name"
    end

    test "update_monster/2 with invalid data returns error changeset" do
      monster = monster_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_monster(monster, @invalid_attrs)
    end

    test "delete_monster/1 deletes the monster" do
      monster = monster_fixture()
      assert {:ok, %Monster{}} = Equipment.delete_monster(monster)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_monster!(monster.id) end
    end

    test "change_monster/1 returns a monster changeset" do
      monster = monster_fixture()
      assert %Ecto.Changeset{} = Equipment.change_monster(monster)
    end
  end

  describe "equipment_pieces" do
    alias IomdbEx.Equipment.Piece

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{
      name: nil,
      special: nil,
      klass: nil,
      weight: nil,
      tp_value: nil,
      rufrin_price: nil
    }

    test "list_equipment_pieces/0 returns all equipment_pieces" do
      piece = piece_fixture()
      [db_piece] = Equipment.list_equipment_pieces()

      assert piece.id == db_piece.id
      assert piece.name == db_piece.name
    end

    test "get_piece!/1 returns the piece with given id" do
      piece = piece_fixture()
      db_piece = Equipment.get_piece!(piece.id)

      assert piece.id == db_piece.id
      assert piece.name == db_piece.name
    end

    test "create_piece/1 with valid data creates a piece" do
      monster = monster_fixture()

      valid_attrs = %{
        name: "some name",
        special: "some special",
        klass: 42,
        weight: 42,
        tp_value: 7,
        rufrin_price: 42,
        equipment_monster_id: monster.id
      }

      assert {:ok, %Piece{} = piece} = Equipment.create_piece(valid_attrs)
      assert piece.name == "some name"
      assert piece.special == "some special"
      assert piece.klass == 42
      assert piece.weight == 42
      assert piece.tp_value == 7
      assert piece.rufrin_price == 42
      assert piece.equipment_monster_id == monster.id
    end

    test "create_piece/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_piece(@invalid_attrs)
    end

    test "update_piece/2 with valid data updates the piece" do
      piece = piece_fixture()

      update_attrs = %{
        name: "some updated name",
        special: "some updated special",
        klass: 43,
        weight: 43,
        tp_value: 6,
        rufrin_price: 43
      }

      assert {:ok, %Piece{} = piece} = Equipment.update_piece(piece, update_attrs)
      assert piece.name == "some updated name"
      assert piece.special == "some updated special"
      assert piece.klass == 43
      assert piece.weight == 43
      assert piece.tp_value == 6
      assert piece.rufrin_price == 43
    end

    test "update_piece/2 with invalid data returns error changeset" do
      piece = piece_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_piece(piece, @invalid_attrs)
    end

    test "delete_piece/1 deletes the piece" do
      piece = piece_fixture()
      assert {:ok, %Piece{}} = Equipment.delete_piece(piece)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_piece!(piece.id) end
    end

    test "change_piece/1 returns a piece changeset" do
      piece = piece_fixture()
      assert %Ecto.Changeset{} = Equipment.change_piece(piece)
    end
  end

  describe "equipment_mob_strategies" do
    alias IomdbEx.Equipment.MonsterStrategy

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{
      equipment_monster_id: nil
    }

    test "list_equipment_mob_strategies/0 returns all equipment_mob_strategies" do
      monster_strategy = monster_strategy_fixture()
      assert Equipment.list_equipment_mob_strategies() == [monster_strategy]
    end

    test "get_monster_strategy!/1 returns the monster_strategy with given id" do
      monster_strategy = monster_strategy_fixture()
      assert Equipment.get_monster_strategy!(monster_strategy.id) == monster_strategy
    end

    test "create_monster_strategy/1 with valid data creates a monster_strategy" do
      monster = monster_fixture()

      valid_attrs = %{
        additional_prot_info: "some additional_prot_info",
        walkthrough: "some walkthrough",
        quest_mob: true,
        fight_notes: "some fight_notes",
        equipment_monster_id: monster.id
      }

      assert {:ok, %MonsterStrategy{} = monster_strategy} =
               Equipment.create_monster_strategy(valid_attrs)

      assert monster_strategy.additional_prot_info == "some additional_prot_info"
      assert monster_strategy.walkthrough == "some walkthrough"
      assert monster_strategy.quest_mob == true
      assert monster_strategy.fight_notes == "some fight_notes"
      assert monster_strategy.equipment_monster_id == monster.id
    end

    test "create_monster_strategy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_monster_strategy(@invalid_attrs)
    end

    test "update_monster_strategy/2 with valid data updates the monster_strategy" do
      monster_strategy = monster_strategy_fixture()

      update_attrs = %{
        additional_prot_info: "some updated additional_prot_info",
        walkthrough: "some updated walkthrough",
        quest_mob: false,
        fight_notes: "some updated fight_notes"
      }

      assert {:ok, %MonsterStrategy{} = monster_strategy} =
               Equipment.update_monster_strategy(monster_strategy, update_attrs)

      assert monster_strategy.additional_prot_info == "some updated additional_prot_info"
      assert monster_strategy.walkthrough == "some updated walkthrough"
      assert monster_strategy.quest_mob == false
      assert monster_strategy.fight_notes == "some updated fight_notes"
    end

    test "update_monster_strategy/2 with invalid data returns error changeset" do
      monster_strategy = monster_strategy_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_monster_strategy(monster_strategy, @invalid_attrs)
    end

    test "delete_monster_strategy/1 deletes the monster_strategy" do
      monster_strategy = monster_strategy_fixture()
      assert {:ok, %MonsterStrategy{}} = Equipment.delete_monster_strategy(monster_strategy)

      assert_raise Ecto.NoResultsError, fn ->
        Equipment.get_monster_strategy!(monster_strategy.id)
      end
    end

    test "change_monster_strategy/1 returns a monster_strategy changeset" do
      monster_strategy = monster_strategy_fixture()
      assert %Ecto.Changeset{} = Equipment.change_monster_strategy(monster_strategy)
    end
  end

  describe "resistance_affects" do
    alias IomdbEx.Equipment.ResistanceAffect
    alias IomdbEx.GameFixtures

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{value: nil}

    test "list_resistance_affects/0 returns all resistance_affects" do
      resistance_affect = resistance_affect_fixture()
      assert Equipment.list_resistance_affects() == [resistance_affect]
    end

    test "get_resistance_affect!/1 returns the resistance_affect with given id" do
      resistance_affect = resistance_affect_fixture()
      assert Equipment.get_resistance_affect!(resistance_affect.id) == resistance_affect
    end

    test "create_resistance_affect/1 with valid data creates a resistance_affect" do
      piece = piece_fixture()
      damage_type = GameFixtures.damage_type_fixture()

      valid_attrs = %{value: 42, equipment_piece_id: piece.id, damage_type_id: damage_type.id}

      assert {:ok, %ResistanceAffect{} = resistance_affect} =
               Equipment.create_resistance_affect(valid_attrs)

      assert resistance_affect.value == 42
    end

    test "create_resistance_affect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_resistance_affect(@invalid_attrs)
    end

    test "update_resistance_affect/2 with valid data updates the resistance_affect" do
      resistance_affect = resistance_affect_fixture()
      update_attrs = %{value: 43}

      assert {:ok, %ResistanceAffect{} = resistance_affect} =
               Equipment.update_resistance_affect(resistance_affect, update_attrs)

      assert resistance_affect.value == 43
    end

    test "update_resistance_affect/2 with invalid data returns error changeset" do
      resistance_affect = resistance_affect_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_resistance_affect(resistance_affect, @invalid_attrs)

      assert resistance_affect == Equipment.get_resistance_affect!(resistance_affect.id)
    end

    test "delete_resistance_affect/1 deletes the resistance_affect" do
      resistance_affect = resistance_affect_fixture()
      assert {:ok, %ResistanceAffect{}} = Equipment.delete_resistance_affect(resistance_affect)

      assert_raise Ecto.NoResultsError, fn ->
        Equipment.get_resistance_affect!(resistance_affect.id)
      end
    end

    test "change_resistance_affect/1 returns a resistance_affect changeset" do
      resistance_affect = resistance_affect_fixture()
      assert %Ecto.Changeset{} = Equipment.change_resistance_affect(resistance_affect)
    end
  end

  describe "skill_affects" do
    alias IomdbEx.Equipment.SkillAffect
    alias IomdbEx.GuildFixtures

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{value: nil}

    test "list_skill_affects/0 returns all skill_affects" do
      skill_affect = skill_affect_fixture()
      assert Equipment.list_skill_affects() == [skill_affect]
    end

    test "get_skill_affect!/1 returns the skill_affect with given id" do
      skill_affect = skill_affect_fixture()
      assert Equipment.get_skill_affect!(skill_affect.id) == skill_affect
    end

    test "create_skill_affect/1 with valid data creates a skill_affect" do
      piece = piece_fixture()
      skill = GuildFixtures.skill_fixture()

      valid_attrs = %{value: 42, equipment_piece_id: piece.id, skill_id: skill.id}

      assert {:ok, %SkillAffect{} = skill_affect} = Equipment.create_skill_affect(valid_attrs)
      assert skill_affect.value == 42
    end

    test "create_skill_affect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_skill_affect(@invalid_attrs)
    end

    test "update_skill_affect/2 with valid data updates the skill_affect" do
      skill_affect = skill_affect_fixture()
      update_attrs = %{value: 43}

      assert {:ok, %SkillAffect{} = skill_affect} =
               Equipment.update_skill_affect(skill_affect, update_attrs)

      assert skill_affect.value == 43
    end

    test "update_skill_affect/2 with invalid data returns error changeset" do
      skill_affect = skill_affect_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_skill_affect(skill_affect, @invalid_attrs)

      assert skill_affect == Equipment.get_skill_affect!(skill_affect.id)
    end

    test "delete_skill_affect/1 deletes the skill_affect" do
      skill_affect = skill_affect_fixture()
      assert {:ok, %SkillAffect{}} = Equipment.delete_skill_affect(skill_affect)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_skill_affect!(skill_affect.id) end
    end

    test "change_skill_affect/1 returns a skill_affect changeset" do
      skill_affect = skill_affect_fixture()
      assert %Ecto.Changeset{} = Equipment.change_skill_affect(skill_affect)
    end
  end

  describe "spell_affects" do
    alias IomdbEx.Equipment.SpellAffect
    alias IomdbEx.GuildFixtures

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{value: nil}

    test "list_spell_affects/0 returns all spell_affects" do
      spell_affect = spell_affect_fixture()
      assert Equipment.list_spell_affects() == [spell_affect]
    end

    test "get_spell_affect!/1 returns the spell_affect with given id" do
      spell_affect = spell_affect_fixture()
      assert Equipment.get_spell_affect!(spell_affect.id) == spell_affect
    end

    test "create_spell_affect/1 with valid data creates a spell_affect" do
      piece = piece_fixture()
      spell = GuildFixtures.spell_fixture()

      valid_attrs = %{value: 42, equipment_piece_id: piece.id, spell_id: spell.id}

      assert {:ok, %SpellAffect{} = spell_affect} = Equipment.create_spell_affect(valid_attrs)
      assert spell_affect.value == 42
    end

    test "create_spell_affect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_spell_affect(@invalid_attrs)
    end

    test "update_spell_affect/2 with valid data updates the spell_affect" do
      spell_affect = spell_affect_fixture()
      update_attrs = %{value: 43}

      assert {:ok, %SpellAffect{} = spell_affect} =
               Equipment.update_spell_affect(spell_affect, update_attrs)

      assert spell_affect.value == 43
    end

    test "update_spell_affect/2 with invalid data returns error changeset" do
      spell_affect = spell_affect_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_spell_affect(spell_affect, @invalid_attrs)

      assert spell_affect == Equipment.get_spell_affect!(spell_affect.id)
    end

    test "delete_spell_affect/1 deletes the spell_affect" do
      spell_affect = spell_affect_fixture()
      assert {:ok, %SpellAffect{}} = Equipment.delete_spell_affect(spell_affect)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_spell_affect!(spell_affect.id) end
    end

    test "change_spell_affect/1 returns a spell_affect changeset" do
      spell_affect = spell_affect_fixture()
      assert %Ecto.Changeset{} = Equipment.change_spell_affect(spell_affect)
    end
  end

  describe "weapon_damage_affects" do
    alias IomdbEx.Equipment.WeaponDamageAffect
    alias IomdbEx.GameFixtures

    import IomdbEx.EquipmentFixtures

    @invalid_attrs %{equipment_piece_id: nil, damage_type_id: nil, weapon_damage_level_id: nil}

    test "list_weapon_damage_affects/0 returns all weapon_damage_affects" do
      weapon_damage_affect = weapon_damage_affect_fixture()
      assert Equipment.list_weapon_damage_affects() == [weapon_damage_affect]
    end

    test "get_weapon_damage_affect!/1 returns the weapon_damage_affect with given id" do
      weapon_damage_affect = weapon_damage_affect_fixture()
      assert Equipment.get_weapon_damage_affect!(weapon_damage_affect.id) == weapon_damage_affect
    end

    test "create_weapon_damage_affect/1 with valid data creates a weapon_damage_affect" do
      piece = piece_fixture()
      damage_type = GameFixtures.damage_type_fixture()
      weapon_damage_level = weapon_damage_level_fixture()

      valid_attrs = %{
        equipment_piece_id: piece.id,
        damage_type_id: damage_type.id,
        weapon_damage_level_id: weapon_damage_level.id
      }

      assert {:ok, %WeaponDamageAffect{}} =
               Equipment.create_weapon_damage_affect(valid_attrs)
    end

    test "create_weapon_damage_affect/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_weapon_damage_affect(@invalid_attrs)
    end

    test "update_weapon_damage_affect/2 with invalid data returns error changeset" do
      weapon_damage_affect = weapon_damage_affect_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Equipment.update_weapon_damage_affect(weapon_damage_affect, @invalid_attrs)
    end

    test "delete_weapon_damage_affect/1 deletes the weapon_damage_affect" do
      weapon_damage_affect = weapon_damage_affect_fixture()

      assert {:ok, %WeaponDamageAffect{}} =
               Equipment.delete_weapon_damage_affect(weapon_damage_affect)

      assert_raise Ecto.NoResultsError, fn ->
        Equipment.get_weapon_damage_affect!(weapon_damage_affect.id)
      end
    end

    test "change_weapon_damage_affect/1 returns a weapon_damage_affect changeset" do
      weapon_damage_affect = weapon_damage_affect_fixture()
      assert %Ecto.Changeset{} = Equipment.change_weapon_damage_affect(weapon_damage_affect)
    end
  end
end
