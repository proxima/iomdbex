defmodule IomdbEx.Repo.Migrations.EnforceDatabaseIntegrity do
  use Ecto.Migration

  alias IomdbEx.{Equipment, EquipmentList, Repo}

  def change do
    # Delete database orphans before adding the appropriate constraints

    Repo.all(EquipmentList.Entry)
    |> Repo.preload([:equipment_piece])
    |> Enum.filter(&is_nil(&1.equipment_piece))
    |> Enum.map(&Repo.delete!(&1))

    Repo.all(EquipmentList.Entry)
    |> Repo.preload([:equipment_piece_list])
    |> Enum.filter(&is_nil(&1.equipment_piece_list))
    |> Enum.map(&Repo.delete!(&1))

    Repo.all(Equipment.SlotAffect)
    |> Repo.preload([:equipment_piece])
    |> Enum.filter(&is_nil(&1.equipment_piece))
    |> Enum.map(&Repo.delete!(&1))

    alter table(:equipment_mob_strategies) do
      modify :equipment_monster_id,
             references(:equipment_monsters, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:equipment_piece_list_entries) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer

      modify :equipment_piece_list_id,
             references(:equipment_piece_lists, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:equipment_pieces) do
      modify :equipment_monster_id,
             references(:equipment_monsters, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:resistance_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:skill_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:slot_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:spell_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:stat_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end

    alter table(:weapon_damage_affects) do
      modify :equipment_piece_id,
             references(:equipment_pieces, on_delete: :delete_all, type: :integer),
             from: :integer
    end
  end
end
