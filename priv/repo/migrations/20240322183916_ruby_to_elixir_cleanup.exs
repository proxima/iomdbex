defmodule IomdbEx.Repo.Migrations.RubyToElixirCleanup do
  use Ecto.Migration

  def change do
    alter table(:admin_users) do
      add :updated_at, :utc_datetime, default: fragment("now()")
    end

    alter table(:alignment_levels) do
      remove :version
    end

    alter table(:armor_class_levels) do
      remove :version
    end

    alter table(:damage_levels) do
      remove :version
    end

    alter table(:damage_types) do
      remove :version
    end

    alter table(:equipment_monsters) do
      remove :version
    end

    alter table(:equipment_pieces) do
      remove :version
    end

    alter table(:guilds) do
      remove :version
    end

    alter table(:hunger_levels) do
      remove :version
    end

    alter table(:races) do
      remove :version
    end

    alter table(:resistance_affects) do
      remove :version
    end

    alter table(:skill_affects) do
      remove :version
    end

    alter table(:skill_train_specs) do
      remove :version
    end

    alter table(:skills) do
      remove :version
    end

    alter table(:slot_affects) do
      remove :version
    end

    alter table(:slots) do
      remove :version
    end

    alter table(:spell_train_specs) do
      remove :version
    end

    alter table(:spell_affects) do
      remove :version
    end

    alter table(:spells) do
      remove :version
    end

    alter table(:stats) do
      remove :version
    end

    alter table(:stat_affects) do
      remove :version
    end

    alter table(:stat_levels) do
      remove :version
    end

    create unique_index(:admin_users, [:login])
    create unique_index(:alignment_levels, [:name])
    create unique_index(:alignment_levels, [:level])
    create unique_index(:armor_class_levels, [:name])
    create unique_index(:armor_class_levels, [:level])
    create unique_index(:damage_levels, [:name])
    create unique_index(:damage_levels, [:level])
    create unique_index(:damage_types, [:name])
    create unique_index(:equipment_monsters, [:name])
    create unique_index(:equipment_piece_list_types, [:name])
    create unique_index(:guilds, [:name])
    create unique_index(:guild_types, [:name])
    create unique_index(:guild_types, [:level])
    create unique_index(:hunger_levels, [:name])
    create unique_index(:hunger_levels, [:level])
    create unique_index(:races, [:name])
    create unique_index(:skills, [:name])
    create unique_index(:slots, [:name])
    create unique_index(:slots, [:abbreviation])
    create unique_index(:spells, [:name])
    create unique_index(:stat_levels, [:name])
    create unique_index(:stat_levels, [:level])
    create unique_index(:stats, [:name])
    create unique_index(:stats, [:abbreviation])
    create unique_index(:weapon_damage_levels, [:name])
    create unique_index(:weapon_damage_levels, [:level])
    create unique_index(:skill_affects, [:equipment_piece_id, :skill_id])
    create unique_index(:slot_affects, [:equipment_piece_id, :slot_id])
    create unique_index(:spell_affects, [:equipment_piece_id, :spell_id])
    create unique_index(:stat_affects, [:equipment_piece_id, :stat_id])
    create unique_index(:resistance_affects, [:equipment_piece_id, :damage_type_id])

    create unique_index(
             :weapon_damage_affects,
             [:equipment_piece_id, :weapon_damage_level_id, :damage_type_id],
             name: "wda_eqpid_wdlid_dt"
           )
  end
end
