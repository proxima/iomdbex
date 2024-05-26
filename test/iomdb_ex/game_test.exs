defmodule IomdbEx.GameTest do
  use IomdbEx.DataCase

  alias IomdbEx.Game

  describe "damage_levels" do
    alias IomdbEx.Game.DamageLevel

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_damage_levels/0 returns all damage_levels" do
      damage_level = damage_level_fixture()
      assert Game.list_damage_levels() == [damage_level]
    end

    test "get_damage_level!/1 returns the damage_level with given id" do
      damage_level = damage_level_fixture()
      assert Game.get_damage_level!(damage_level.id) == damage_level
    end

    test "create_damage_level/1 with valid data creates a damage_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %DamageLevel{} = damage_level} = Game.create_damage_level(valid_attrs)
      assert damage_level.name == "some name"
      assert damage_level.level == 42
    end

    test "create_damage_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_damage_level(@invalid_attrs)
    end

    test "update_damage_level/2 with valid data updates the damage_level" do
      damage_level = damage_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %DamageLevel{} = damage_level} =
               Game.update_damage_level(damage_level, update_attrs)

      assert damage_level.name == "some updated name"
      assert damage_level.level == 43
    end

    test "update_damage_level/2 with invalid data returns error changeset" do
      damage_level = damage_level_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_damage_level(damage_level, @invalid_attrs)
      assert damage_level == Game.get_damage_level!(damage_level.id)
    end

    test "delete_damage_level/1 deletes the damage_level" do
      damage_level = damage_level_fixture()
      assert {:ok, %DamageLevel{}} = Game.delete_damage_level(damage_level)
      assert_raise Ecto.NoResultsError, fn -> Game.get_damage_level!(damage_level.id) end
    end

    test "change_damage_level/1 returns a damage_level changeset" do
      damage_level = damage_level_fixture()
      assert %Ecto.Changeset{} = Game.change_damage_level(damage_level)
    end
  end

  describe "alignment_levels" do
    alias IomdbEx.Game.AlignmentLevel

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_alignment_levels/0 returns all alignment_levels" do
      alignment_level = alignment_level_fixture()
      assert Game.list_alignment_levels() == [alignment_level]
    end

    test "get_alignment_level!/1 returns the alignment_level with given id" do
      alignment_level = alignment_level_fixture()
      assert Game.get_alignment_level!(alignment_level.id) == alignment_level
    end

    test "create_alignment_level/1 with valid data creates a alignment_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %AlignmentLevel{} = alignment_level} = Game.create_alignment_level(valid_attrs)
      assert alignment_level.name == "some name"
      assert alignment_level.level == 42
    end

    test "create_alignment_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_alignment_level(@invalid_attrs)
    end

    test "update_alignment_level/2 with valid data updates the alignment_level" do
      alignment_level = alignment_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %AlignmentLevel{} = alignment_level} =
               Game.update_alignment_level(alignment_level, update_attrs)

      assert alignment_level.name == "some updated name"
      assert alignment_level.level == 43
    end

    test "update_alignment_level/2 with invalid data returns error changeset" do
      alignment_level = alignment_level_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Game.update_alignment_level(alignment_level, @invalid_attrs)

      assert alignment_level == Game.get_alignment_level!(alignment_level.id)
    end

    test "delete_alignment_level/1 deletes the alignment_level" do
      alignment_level = alignment_level_fixture()
      assert {:ok, %AlignmentLevel{}} = Game.delete_alignment_level(alignment_level)
      assert_raise Ecto.NoResultsError, fn -> Game.get_alignment_level!(alignment_level.id) end
    end

    test "change_alignment_level/1 returns a alignment_level changeset" do
      alignment_level = alignment_level_fixture()
      assert %Ecto.Changeset{} = Game.change_alignment_level(alignment_level)
    end
  end

  describe "damage_types" do
    alias IomdbEx.Game.DamageType

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil}

    test "list_damage_types/0 returns all damage_types" do
      damage_type = damage_type_fixture()
      assert Game.list_damage_types() == [damage_type]
    end

    test "get_damage_type!/1 returns the damage_type with given id" do
      damage_type = damage_type_fixture()
      assert Game.get_damage_type!(damage_type.id) == damage_type
    end

    test "create_damage_type/1 with valid data creates a damage_type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %DamageType{} = damage_type} = Game.create_damage_type(valid_attrs)
      assert damage_type.name == "some name"
    end

    test "create_damage_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_damage_type(@invalid_attrs)
    end

    test "update_damage_type/2 with valid data updates the damage_type" do
      damage_type = damage_type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %DamageType{} = damage_type} =
               Game.update_damage_type(damage_type, update_attrs)

      assert damage_type.name == "some updated name"
    end

    test "update_damage_type/2 with invalid data returns error changeset" do
      damage_type = damage_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_damage_type(damage_type, @invalid_attrs)
      assert damage_type == Game.get_damage_type!(damage_type.id)
    end

    test "delete_damage_type/1 deletes the damage_type" do
      damage_type = damage_type_fixture()
      assert {:ok, %DamageType{}} = Game.delete_damage_type(damage_type)
      assert_raise Ecto.NoResultsError, fn -> Game.get_damage_type!(damage_type.id) end
    end

    test "change_damage_type/1 returns a damage_type changeset" do
      damage_type = damage_type_fixture()
      assert %Ecto.Changeset{} = Game.change_damage_type(damage_type)
    end
  end

  describe "hunger_levels" do
    alias IomdbEx.Game.HungerLevel

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_hunger_levels/0 returns all hunger_levels" do
      hunger_level = hunger_level_fixture()
      assert Game.list_hunger_levels() == [hunger_level]
    end

    test "get_hunger_level!/1 returns the hunger_level with given id" do
      hunger_level = hunger_level_fixture()
      assert Game.get_hunger_level!(hunger_level.id) == hunger_level
    end

    test "create_hunger_level/1 with valid data creates a hunger_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %HungerLevel{} = hunger_level} = Game.create_hunger_level(valid_attrs)
      assert hunger_level.name == "some name"
      assert hunger_level.level == 42
    end

    test "create_hunger_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_hunger_level(@invalid_attrs)
    end

    test "update_hunger_level/2 with valid data updates the hunger_level" do
      hunger_level = hunger_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %HungerLevel{} = hunger_level} =
               Game.update_hunger_level(hunger_level, update_attrs)

      assert hunger_level.name == "some updated name"
      assert hunger_level.level == 43
    end

    test "update_hunger_level/2 with invalid data returns error changeset" do
      hunger_level = hunger_level_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_hunger_level(hunger_level, @invalid_attrs)
      assert hunger_level == Game.get_hunger_level!(hunger_level.id)
    end

    test "delete_hunger_level/1 deletes the hunger_level" do
      hunger_level = hunger_level_fixture()
      assert {:ok, %HungerLevel{}} = Game.delete_hunger_level(hunger_level)
      assert_raise Ecto.NoResultsError, fn -> Game.get_hunger_level!(hunger_level.id) end
    end

    test "change_hunger_level/1 returns a hunger_level changeset" do
      hunger_level = hunger_level_fixture()
      assert %Ecto.Changeset{} = Game.change_hunger_level(hunger_level)
    end
  end

  describe "stats" do
    alias IomdbEx.Game.Stat

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, abbreviation: nil}

    test "list_stats/0 returns all stats" do
      stat = stat_fixture()
      assert Game.list_stats() == [stat]
    end

    test "get_stat!/1 returns the stat with given id" do
      stat = stat_fixture()
      assert Game.get_stat!(stat.id) == stat
    end

    test "create_stat/1 with valid data creates a stat" do
      valid_attrs = %{name: "some name", abbreviation: "some abbreviation"}

      assert {:ok, %Stat{} = stat} = Game.create_stat(valid_attrs)
      assert stat.name == "some name"
      assert stat.abbreviation == "some abbreviation"
    end

    test "create_stat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_stat(@invalid_attrs)
    end

    test "update_stat/2 with valid data updates the stat" do
      stat = stat_fixture()
      update_attrs = %{name: "some updated name", abbreviation: "some updated abbreviation"}

      assert {:ok, %Stat{} = stat} = Game.update_stat(stat, update_attrs)
      assert stat.name == "some updated name"
      assert stat.abbreviation == "some updated abbreviation"
    end

    test "update_stat/2 with invalid data returns error changeset" do
      stat = stat_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_stat(stat, @invalid_attrs)
      assert stat == Game.get_stat!(stat.id)
    end

    test "delete_stat/1 deletes the stat" do
      stat = stat_fixture()
      assert {:ok, %Stat{}} = Game.delete_stat(stat)
      assert_raise Ecto.NoResultsError, fn -> Game.get_stat!(stat.id) end
    end

    test "change_stat/1 returns a stat changeset" do
      stat = stat_fixture()
      assert %Ecto.Changeset{} = Game.change_stat(stat)
    end
  end

  describe "slots" do
    alias IomdbEx.Game.Slot

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, abbreviation: nil}

    test "list_slots/0 returns all slots" do
      slot = slot_fixture()
      assert Game.list_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Game.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      valid_attrs = %{name: "some name", abbreviation: "some abbreviation"}

      assert {:ok, %Slot{} = slot} = Game.create_slot(valid_attrs)
      assert slot.name == "some name"
      assert slot.abbreviation == "some abbreviation"
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      update_attrs = %{name: "some updated name", abbreviation: "some updated abbreviation"}

      assert {:ok, %Slot{} = slot} = Game.update_slot(slot, update_attrs)
      assert slot.name == "some updated name"
      assert slot.abbreviation == "some updated abbreviation"
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_slot(slot, @invalid_attrs)
      assert slot == Game.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Game.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Game.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Game.change_slot(slot)
    end
  end

  describe "stat_levels" do
    alias IomdbEx.Game.StatLevel

    import IomdbEx.GameFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_stat_levels/0 returns all stat_levels" do
      stat_level = stat_level_fixture()
      assert Game.list_stat_levels() == [stat_level]
    end

    test "get_stat_level!/1 returns the stat_level with given id" do
      stat_level = stat_level_fixture()
      assert Game.get_stat_level!(stat_level.id) == stat_level
    end

    test "create_stat_level/1 with valid data creates a stat_level" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %StatLevel{} = stat_level} = Game.create_stat_level(valid_attrs)
      assert stat_level.name == "some name"
      assert stat_level.level == 42
    end

    test "create_stat_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_stat_level(@invalid_attrs)
    end

    test "update_stat_level/2 with valid data updates the stat_level" do
      stat_level = stat_level_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %StatLevel{} = stat_level} = Game.update_stat_level(stat_level, update_attrs)
      assert stat_level.name == "some updated name"
      assert stat_level.level == 43
    end

    test "update_stat_level/2 with invalid data returns error changeset" do
      stat_level = stat_level_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_stat_level(stat_level, @invalid_attrs)
      assert stat_level == Game.get_stat_level!(stat_level.id)
    end

    test "delete_stat_level/1 deletes the stat_level" do
      stat_level = stat_level_fixture()
      assert {:ok, %StatLevel{}} = Game.delete_stat_level(stat_level)
      assert_raise Ecto.NoResultsError, fn -> Game.get_stat_level!(stat_level.id) end
    end

    test "change_stat_level/1 returns a stat_level changeset" do
      stat_level = stat_level_fixture()
      assert %Ecto.Changeset{} = Game.change_stat_level(stat_level)
    end
  end

  describe "races" do
    alias IomdbEx.Game.Race

    import IomdbEx.GameFixtures

    @invalid_attrs %{
      name: nil,
      description: nil,
      strength: nil,
      dexterity: nil,
      constitution: nil,
      intelligence: nil,
      wisdom: nil,
      stamina: nil,
      charisma: nil,
      hpregen: nil,
      spregen: nil,
      epregen: nil,
      skill_max: nil,
      spell_max: nil,
      skill_rate: nil,
      spell_rate: nil,
      experience_rate: nil,
      need_dark_to_regen: nil,
      need_light_to_regen: nil,
      corpse_eating: nil,
      average_height: nil,
      average_weight: nil
    }

    test "list_races/0 returns all races" do
      race = race_fixture()
      assert Game.list_races() == [race]
    end

    test "get_race!/1 returns the race with given id" do
      race = race_fixture()
      assert Game.get_race!(race.id) == race
    end

    test "create_race/1 with valid data creates a race" do
      valid_attrs = %{
        name: "some name",
        description: "some description",
        strength: 42,
        dexterity: 42,
        constitution: 42,
        intelligence: 42,
        wisdom: 42,
        stamina: 42,
        charisma: 42,
        hpregen: 42,
        spregen: 42,
        epregen: 42,
        skill_max: 42,
        spell_max: 42,
        skill_rate: 42,
        spell_rate: 42,
        experience_rate: 42,
        need_dark_to_regen: true,
        need_light_to_regen: true,
        corpse_eating: true,
        average_height: 42,
        average_weight: 42
      }

      assert {:ok, %Race{} = race} = Game.create_race(valid_attrs)
      assert race.name == "some name"
      assert race.description == "some description"
      assert race.strength == 42
      assert race.dexterity == 42
      assert race.constitution == 42
      assert race.intelligence == 42
      assert race.wisdom == 42
      assert race.stamina == 42
      assert race.charisma == 42
      assert race.hpregen == 42
      assert race.spregen == 42
      assert race.epregen == 42
      assert race.skill_max == 42
      assert race.spell_max == 42
      assert race.skill_rate == 42
      assert race.spell_rate == 42
      assert race.experience_rate == 42
      assert race.need_dark_to_regen == true
      assert race.need_light_to_regen == true
      assert race.corpse_eating == true
      assert race.average_height == 42
      assert race.average_weight == 42
    end

    test "create_race/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_race(@invalid_attrs)
    end

    test "update_race/2 with valid data updates the race" do
      race = race_fixture()

      update_attrs = %{
        name: "some updated name",
        description: "some updated description",
        strength: 43,
        dexterity: 43,
        constitution: 43,
        intelligence: 43,
        wisdom: 43,
        stamina: 43,
        charisma: 43,
        hpregen: 43,
        spregen: 43,
        epregen: 43,
        skill_max: 43,
        spell_max: 43,
        skill_rate: 43,
        spell_rate: 43,
        experience_rate: 43,
        need_dark_to_regen: false,
        need_light_to_regen: false,
        corpse_eating: false,
        average_height: 43,
        average_weight: 43
      }

      assert {:ok, %Race{} = race} = Game.update_race(race, update_attrs)
      assert race.name == "some updated name"
      assert race.description == "some updated description"
      assert race.strength == 43
      assert race.dexterity == 43
      assert race.constitution == 43
      assert race.intelligence == 43
      assert race.wisdom == 43
      assert race.stamina == 43
      assert race.charisma == 43
      assert race.hpregen == 43
      assert race.spregen == 43
      assert race.epregen == 43
      assert race.skill_max == 43
      assert race.spell_max == 43
      assert race.skill_rate == 43
      assert race.spell_rate == 43
      assert race.experience_rate == 43
      assert race.need_dark_to_regen == false
      assert race.need_light_to_regen == false
      assert race.corpse_eating == false
      assert race.average_height == 43
      assert race.average_weight == 43
    end

    test "update_race/2 with invalid data returns error changeset" do
      race = race_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_race(race, @invalid_attrs)
      assert race == Game.get_race!(race.id)
    end

    test "delete_race/1 deletes the race" do
      race = race_fixture()
      assert {:ok, %Race{}} = Game.delete_race(race)
      assert_raise Ecto.NoResultsError, fn -> Game.get_race!(race.id) end
    end

    test "change_race/1 returns a race changeset" do
      race = race_fixture()
      assert %Ecto.Changeset{} = Game.change_race(race)
    end
  end
end
