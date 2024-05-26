defmodule IomdbEx.GuildTest do
  use IomdbEx.DataCase

  alias IomdbEx.Guild

  describe "spells" do
    alias IomdbEx.Guild.Spell

    import IomdbEx.GuildFixtures

    @invalid_attrs %{name: nil, base_cost: nil}

    test "list_spells/0 returns all spells" do
      spell = spell_fixture()
      assert Guild.list_spells() == [spell]
    end

    test "get_spell!/1 returns the spell with given id" do
      spell = spell_fixture()
      assert Guild.get_spell!(spell.id) == spell
    end

    test "create_spell/1 with valid data creates a spell" do
      valid_attrs = %{name: "some name", base_cost: 42}

      assert {:ok, %Spell{} = spell} = Guild.create_spell(valid_attrs)
      assert spell.name == "some name"
      assert spell.base_cost == 42
    end

    test "create_spell/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guild.create_spell(@invalid_attrs)
    end

    test "update_spell/2 with valid data updates the spell" do
      spell = spell_fixture()
      update_attrs = %{name: "some updated name", base_cost: 43}

      assert {:ok, %Spell{} = spell} = Guild.update_spell(spell, update_attrs)
      assert spell.name == "some updated name"
      assert spell.base_cost == 43
    end

    test "update_spell/2 with invalid data returns error changeset" do
      spell = spell_fixture()
      assert {:error, %Ecto.Changeset{}} = Guild.update_spell(spell, @invalid_attrs)
      assert spell == Guild.get_spell!(spell.id)
    end

    test "delete_spell/1 deletes the spell" do
      spell = spell_fixture()
      assert {:ok, %Spell{}} = Guild.delete_spell(spell)
      assert_raise Ecto.NoResultsError, fn -> Guild.get_spell!(spell.id) end
    end

    test "change_spell/1 returns a spell changeset" do
      spell = spell_fixture()
      assert %Ecto.Changeset{} = Guild.change_spell(spell)
    end
  end

  describe "skills" do
    alias IomdbEx.Guild.Skill

    import IomdbEx.GuildFixtures

    @invalid_attrs %{name: nil, base_cost: nil}

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Guild.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Guild.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      valid_attrs = %{name: "some name", base_cost: 42}

      assert {:ok, %Skill{} = skill} = Guild.create_skill(valid_attrs)
      assert skill.name == "some name"
      assert skill.base_cost == 42
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guild.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      update_attrs = %{name: "some updated name", base_cost: 43}

      assert {:ok, %Skill{} = skill} = Guild.update_skill(skill, update_attrs)
      assert skill.name == "some updated name"
      assert skill.base_cost == 43
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Guild.update_skill(skill, @invalid_attrs)
      assert skill == Guild.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Guild.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Guild.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Guild.change_skill(skill)
    end
  end

  describe "guild_types" do
    alias IomdbEx.Guild.Type

    import IomdbEx.GuildFixtures

    @invalid_attrs %{name: nil, level: nil}

    test "list_guild_types/0 returns all guild_types" do
      guild_type = guild_type_fixture()
      assert Guild.list_guild_types() == [guild_type]
    end

    test "get_guild_type!/1 returns the guild_type with given id" do
      guild_type = guild_type_fixture()
      assert Guild.get_guild_type!(guild_type.id) == guild_type
    end

    test "create_guild_type/1 with valid data creates a guild_type" do
      valid_attrs = %{name: "some name", level: 42}

      assert {:ok, %Type{} = guild_type} = Guild.create_guild_type(valid_attrs)
      assert guild_type.name == "some name"
      assert guild_type.level == 42
    end

    test "create_guild_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guild.create_guild_type(@invalid_attrs)
    end

    test "update_guild_type/2 with valid data updates the guild_type" do
      guild_type = guild_type_fixture()
      update_attrs = %{name: "some updated name", level: 43}

      assert {:ok, %Type{} = guild_type} = Guild.update_guild_type(guild_type, update_attrs)
      assert guild_type.name == "some updated name"
      assert guild_type.level == 43
    end

    test "update_guild_type/2 with invalid data returns error changeset" do
      guild_type = guild_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Guild.update_guild_type(guild_type, @invalid_attrs)
      assert guild_type == Guild.get_guild_type!(guild_type.id)
    end

    test "delete_guild_type/1 deletes the guild_type" do
      guild_type = guild_type_fixture()
      assert {:ok, %Type{}} = Guild.delete_guild_type(guild_type)
      assert_raise Ecto.NoResultsError, fn -> Guild.get_guild_type!(guild_type.id) end
    end

    test "change_guild_type/1 returns a guild_type changeset" do
      guild_type = guild_type_fixture()
      assert %Ecto.Changeset{} = Guild.change_guild_type(guild_type)
    end
  end

  describe "skill_train_specs" do
    alias IomdbEx.Guild.SkillTrainSpec

    import IomdbEx.GuildFixtures

    @invalid_attrs %{max: nil, level: nil}

    test "list_skill_train_specs/0 returns all skill_train_specs" do
      skill_train_spec = skill_train_spec_fixture()
      assert Guild.list_skill_train_specs() == [skill_train_spec]
    end

    test "get_skill_train_spec!/1 returns the skill_train_spec with given id" do
      skill_train_spec = skill_train_spec_fixture()
      assert Guild.get_skill_train_spec!(skill_train_spec.id) == skill_train_spec
    end

    test "create_skill_train_spec/1 with valid data creates a skill_train_spec" do
      valid_attrs = %{max: 42, level: 42}

      assert {:ok, %SkillTrainSpec{} = skill_train_spec} =
               Guild.create_skill_train_spec(valid_attrs)

      assert skill_train_spec.max == 42
      assert skill_train_spec.level == 42
    end

    test "create_skill_train_spec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guild.create_skill_train_spec(@invalid_attrs)
    end

    test "update_skill_train_spec/2 with valid data updates the skill_train_spec" do
      skill_train_spec = skill_train_spec_fixture()
      update_attrs = %{max: 43, level: 43}

      assert {:ok, %SkillTrainSpec{} = skill_train_spec} =
               Guild.update_skill_train_spec(skill_train_spec, update_attrs)

      assert skill_train_spec.max == 43
      assert skill_train_spec.level == 43
    end

    test "update_skill_train_spec/2 with invalid data returns error changeset" do
      skill_train_spec = skill_train_spec_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Guild.update_skill_train_spec(skill_train_spec, @invalid_attrs)

      assert skill_train_spec == Guild.get_skill_train_spec!(skill_train_spec.id)
    end

    test "delete_skill_train_spec/1 deletes the skill_train_spec" do
      skill_train_spec = skill_train_spec_fixture()
      assert {:ok, %SkillTrainSpec{}} = Guild.delete_skill_train_spec(skill_train_spec)
      assert_raise Ecto.NoResultsError, fn -> Guild.get_skill_train_spec!(skill_train_spec.id) end
    end

    test "change_skill_train_spec/1 returns a skill_train_spec changeset" do
      skill_train_spec = skill_train_spec_fixture()
      assert %Ecto.Changeset{} = Guild.change_skill_train_spec(skill_train_spec)
    end
  end

  describe "spell_train_specs" do
    alias IomdbEx.Guild.SpellTrainSpec

    import IomdbEx.GuildFixtures

    @invalid_attrs %{max: nil, level: nil}

    test "list_spell_train_specs/0 returns all spell_train_specs" do
      spell_train_spec = spell_train_spec_fixture()
      assert Guild.list_spell_train_specs() == [spell_train_spec]
    end

    test "get_spell_train_spec!/1 returns the spell_train_spec with given id" do
      spell_train_spec = spell_train_spec_fixture()
      assert Guild.get_spell_train_spec!(spell_train_spec.id) == spell_train_spec
    end

    test "create_spell_train_spec/1 with valid data creates a spell_train_spec" do
      valid_attrs = %{max: 42, level: 42}

      assert {:ok, %SpellTrainSpec{} = spell_train_spec} =
               Guild.create_spell_train_spec(valid_attrs)

      assert spell_train_spec.max == 42
      assert spell_train_spec.level == 42
    end

    test "create_spell_train_spec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guild.create_spell_train_spec(@invalid_attrs)
    end

    test "update_spell_train_spec/2 with valid data updates the spell_train_spec" do
      spell_train_spec = spell_train_spec_fixture()
      update_attrs = %{max: 43, level: 43}

      assert {:ok, %SpellTrainSpec{} = spell_train_spec} =
               Guild.update_spell_train_spec(spell_train_spec, update_attrs)

      assert spell_train_spec.max == 43
      assert spell_train_spec.level == 43
    end

    test "update_spell_train_spec/2 with invalid data returns error changeset" do
      spell_train_spec = spell_train_spec_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Guild.update_spell_train_spec(spell_train_spec, @invalid_attrs)

      assert spell_train_spec == Guild.get_spell_train_spec!(spell_train_spec.id)
    end

    test "delete_spell_train_spec/1 deletes the spell_train_spec" do
      spell_train_spec = spell_train_spec_fixture()
      assert {:ok, %SpellTrainSpec{}} = Guild.delete_spell_train_spec(spell_train_spec)
      assert_raise Ecto.NoResultsError, fn -> Guild.get_spell_train_spec!(spell_train_spec.id) end
    end

    test "change_spell_train_spec/1 returns a spell_train_spec changeset" do
      spell_train_spec = spell_train_spec_fixture()
      assert %Ecto.Changeset{} = Guild.change_spell_train_spec(spell_train_spec)
    end
  end
end
