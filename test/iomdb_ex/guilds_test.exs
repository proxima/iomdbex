defmodule IomdbEx.GuildsTest do
  use IomdbEx.DataCase

  alias IomdbEx.Guilds

  describe "guilds" do
    alias IomdbEx.Guilds.Guild

    import IomdbEx.GuildsFixtures

    @invalid_attrs %{name: nil, location: nil, levels: nil, guild_type_id: nil}

    test "list_guilds/0 returns all guilds" do
      guild = guild_fixture()
      assert Guilds.list_guilds() == [guild]
    end

    test "get_guild!/1 returns the guild with given id" do
      guild = guild_fixture()
      assert Guilds.get_guild!(guild.id) == guild
    end

    test "create_guild/1 with valid data creates a guild" do
      valid_attrs = %{name: "some name", location: "some location", levels: 42, guild_type_id: 1}

      assert {:ok, %Guild{} = guild} = Guilds.create_guild(valid_attrs)
      assert guild.name == "some name"
      assert guild.location == "some location"
      assert guild.levels == 42
      assert guild.guild_type_id == 1
    end

    test "create_guild/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guilds.create_guild(@invalid_attrs)
    end

    test "update_guild/2 with valid data updates the guild" do
      guild = guild_fixture()

      update_attrs = %{
        name: "some updated name",
        location: "some updated location",
        levels: 43,
        guild_type_id: 2
      }

      assert {:ok, %Guild{} = guild} = Guilds.update_guild(guild, update_attrs)
      assert guild.name == "some updated name"
      assert guild.location == "some updated location"
      assert guild.levels == 43
      assert guild.guild_type_id == 2
    end

    test "update_guild/2 with invalid data returns error changeset" do
      guild = guild_fixture()
      assert {:error, %Ecto.Changeset{}} = Guilds.update_guild(guild, @invalid_attrs)
      assert guild == Guilds.get_guild!(guild.id)
    end

    test "delete_guild/1 deletes the guild" do
      guild = guild_fixture()
      assert {:ok, %Guild{}} = Guilds.delete_guild(guild)
      assert_raise Ecto.NoResultsError, fn -> Guilds.get_guild!(guild.id) end
    end

    test "change_guild/1 returns a guild changeset" do
      guild = guild_fixture()
      assert %Ecto.Changeset{} = Guilds.change_guild(guild)
    end
  end
end
