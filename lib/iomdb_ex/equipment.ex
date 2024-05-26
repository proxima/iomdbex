defmodule IomdbEx.Equipment do
  @moduledoc """
  The Equipment context.
  """

  import Ecto.Query, warn: false
  alias IomdbEx.Repo

  alias IomdbEx.Equipment.ArmorClassLevel

  @doc """
  Returns the list of armor_class_levels.

  ## Examples

      iex> list_armor_class_levels()
      [%ArmorClassLevel{}, ...]

  """
  def list_armor_class_levels do
    Repo.all(ArmorClassLevel)
  end

  @doc """
  Gets a single armor_class_level.

  Raises `Ecto.NoResultsError` if the Armor class level does not exist.

  ## Examples

      iex> get_armor_class_level!(123)
      %ArmorClassLevel{}

      iex> get_armor_class_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_armor_class_level!(id), do: Repo.get!(ArmorClassLevel, id)

  @doc """
  Creates a armor_class_level.

  ## Examples

      iex> create_armor_class_level(%{field: value})
      {:ok, %ArmorClassLevel{}}

      iex> create_armor_class_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_armor_class_level(attrs \\ %{}) do
    %ArmorClassLevel{}
    |> ArmorClassLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a armor_class_level.

  ## Examples

      iex> update_armor_class_level(armor_class_level, %{field: new_value})
      {:ok, %ArmorClassLevel{}}

      iex> update_armor_class_level(armor_class_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_armor_class_level(%ArmorClassLevel{} = armor_class_level, attrs) do
    armor_class_level
    |> ArmorClassLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a armor_class_level.

  ## Examples

      iex> delete_armor_class_level(armor_class_level)
      {:ok, %ArmorClassLevel{}}

      iex> delete_armor_class_level(armor_class_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_armor_class_level(%ArmorClassLevel{} = armor_class_level) do
    Repo.delete(armor_class_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking armor_class_level changes.

  ## Examples

      iex> change_armor_class_level(armor_class_level)
      %Ecto.Changeset{data: %ArmorClassLevel{}}

  """
  def change_armor_class_level(%ArmorClassLevel{} = armor_class_level, attrs \\ %{}) do
    ArmorClassLevel.changeset(armor_class_level, attrs)
  end

  alias IomdbEx.Equipment.WeaponDamageLevel

  @doc """
  Returns the list of weapon_damage_levels.

  ## Examples

      iex> list_weapon_damage_levels()
      [%WeaponDamageLevel{}, ...]

  """
  def list_weapon_damage_levels do
    Repo.all(WeaponDamageLevel)
  end

  @doc """
  Gets a single weapon_damage_level.

  Raises `Ecto.NoResultsError` if the Weapon damage level does not exist.

  ## Examples

      iex> get_weapon_damage_level!(123)
      %WeaponDamageLevel{}

      iex> get_weapon_damage_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_damage_level!(id), do: Repo.get!(WeaponDamageLevel, id)

  @doc """
  Creates a weapon_damage_level.

  ## Examples

      iex> create_weapon_damage_level(%{field: value})
      {:ok, %WeaponDamageLevel{}}

      iex> create_weapon_damage_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_damage_level(attrs \\ %{}) do
    %WeaponDamageLevel{}
    |> WeaponDamageLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_damage_level.

  ## Examples

      iex> update_weapon_damage_level(weapon_damage_level, %{field: new_value})
      {:ok, %WeaponDamageLevel{}}

      iex> update_weapon_damage_level(weapon_damage_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_damage_level(%WeaponDamageLevel{} = weapon_damage_level, attrs) do
    weapon_damage_level
    |> WeaponDamageLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_damage_level.

  ## Examples

      iex> delete_weapon_damage_level(weapon_damage_level)
      {:ok, %WeaponDamageLevel{}}

      iex> delete_weapon_damage_level(weapon_damage_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_damage_level(%WeaponDamageLevel{} = weapon_damage_level) do
    Repo.delete(weapon_damage_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_damage_level changes.

  ## Examples

      iex> change_weapon_damage_level(weapon_damage_level)
      %Ecto.Changeset{data: %WeaponDamageLevel{}}

  """
  def change_weapon_damage_level(%WeaponDamageLevel{} = weapon_damage_level, attrs \\ %{}) do
    WeaponDamageLevel.changeset(weapon_damage_level, attrs)
  end

  alias IomdbEx.Equipment.Monster

  @doc """
  Returns the list of equipment_monsters.

  ## Examples

      iex> list_equipment_monsters()
      [%Monster{}, ...]

  """
  def list_equipment_monsters do
    Repo.all(from m in Monster, order_by: [asc: m.name])
  end

  @doc """
  Gets a single monster.

  Raises `Ecto.NoResultsError` if the Monster does not exist.

  ## Examples

      iex> get_monster!(123)
      %Monster{}

      iex> get_monster!(456)
      ** (Ecto.NoResultsError)

  """
  def get_monster!(id) do
    Repo.get!(Monster, id)
    |> Repo.preload(
      equipment_pieces: [
        [skill_affects: :skill],
        [slot_affects: :slot],
        [spell_affects: :spell],
        [stat_affects: :stat],
        [resistance_affects: :damage_type],
        [weapon_damage_affects: [:weapon_damage_level, :damage_type]]
      ]
    )
  end

  @doc """
  Creates a monster.

  ## Examples

      iex> create_monster(%{field: value})
      {:ok, %Monster{}}

      iex> create_monster(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_monster(attrs \\ %{}) do
    %Monster{}
    |> Monster.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a monster.

  ## Examples

      iex> update_monster(monster, %{field: new_value})
      {:ok, %Monster{}}

      iex> update_monster(monster, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_monster(%Monster{} = monster, attrs) do
    monster
    |> Monster.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a monster.

  ## Examples

      iex> delete_monster(monster)
      {:ok, %Monster{}}

      iex> delete_monster(monster)
      {:error, %Ecto.Changeset{}}

  """
  def delete_monster(%Monster{} = monster) do
    Repo.delete(monster)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking monster changes.

  ## Examples

      iex> change_monster(monster)
      %Ecto.Changeset{data: %Monster{}}

  """
  def change_monster(%Monster{} = monster, attrs \\ %{}) do
    Monster.changeset(monster, attrs)
  end

  alias IomdbEx.Equipment.Piece

  @doc """
  Returns the list of equipment_pieces.

  ## Examples

      iex> list_equipment_pieces()
      [%Piece{}, ...]

  """
  def list_equipment_pieces do
    query = from p in Piece, limit: 50

    Repo.all(query)
    |> Repo.preload([
      :equipment_monster,
      [skill_affects: :skill],
      [slot_affects: :slot],
      [spell_affects: :spell],
      [stat_affects: :stat],
      [resistance_affects: :damage_type],
      [weapon_damage_affects: [:weapon_damage_level, :damage_type]]
    ])
  end

  @doc """
  Gets a single piece.

  Raises `Ecto.NoResultsError` if the Piece does not exist.

  ## Examples

      iex> get_piece!(123)
      %Piece{}

      iex> get_piece!(456)
      ** (Ecto.NoResultsError)

  """
  def get_piece!(id) do
    Repo.get!(Piece, id)
    |> Repo.preload([
      :equipment_monster,
      [skill_affects: :skill],
      [slot_affects: :slot],
      [spell_affects: :spell],
      [stat_affects: :stat],
      [resistance_affects: :damage_type],
      [weapon_damage_affects: [:weapon_damage_level, :damage_type]]
    ])
  end

  @doc """
  Creates a piece.

  ## Examples

      iex> create_piece(%{field: value})
      {:ok, %Piece{}}

      iex> create_piece(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_piece(attrs \\ %{}) do
    %Piece{}
    |> Piece.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a piece.

  ## Examples

      iex> update_piece(piece, %{field: new_value})
      {:ok, %Piece{}}

      iex> update_piece(piece, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_piece(%Piece{} = piece, attrs) do
    piece
    |> Piece.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a piece.

  ## Examples

      iex> delete_piece(piece)
      {:ok, %Piece{}}

      iex> delete_piece(piece)
      {:error, %Ecto.Changeset{}}

  """
  def delete_piece(%Piece{} = piece) do
    Repo.delete(piece)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking piece changes.

  ## Examples

      iex> change_piece(piece)
      %Ecto.Changeset{data: %Piece{}}

  """
  def change_piece(%Piece{} = piece, attrs \\ %{}) do
    Piece.changeset(piece, attrs)
  end

  alias IomdbEx.Equipment.MonsterStrategy

  @doc """
  Returns the list of equipment_mob_strategies.

  ## Examples

      iex> list_equipment_mob_strategies()
      [%MonsterStrategy{}, ...]

  """
  def list_equipment_mob_strategies do
    Repo.all(MonsterStrategy)
  end

  @doc """
  Gets a single monster_strategy.

  Raises `Ecto.NoResultsError` if the Monster strategy does not exist.

  ## Examples

      iex> get_monster_strategy!(123)
      %MonsterStrategy{}

      iex> get_monster_strategy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_monster_strategy!(id), do: Repo.get!(MonsterStrategy, id)

  @doc """
  Creates a monster_strategy.

  ## Examples

      iex> create_monster_strategy(%{field: value})
      {:ok, %MonsterStrategy{}}

      iex> create_monster_strategy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_monster_strategy(attrs \\ %{}) do
    %MonsterStrategy{}
    |> MonsterStrategy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a monster_strategy.

  ## Examples

      iex> update_monster_strategy(monster_strategy, %{field: new_value})
      {:ok, %MonsterStrategy{}}

      iex> update_monster_strategy(monster_strategy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_monster_strategy(%MonsterStrategy{} = monster_strategy, attrs) do
    monster_strategy
    |> MonsterStrategy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a monster_strategy.

  ## Examples

      iex> delete_monster_strategy(monster_strategy)
      {:ok, %MonsterStrategy{}}

      iex> delete_monster_strategy(monster_strategy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_monster_strategy(%MonsterStrategy{} = monster_strategy) do
    Repo.delete(monster_strategy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking monster_strategy changes.

  ## Examples

      iex> change_monster_strategy(monster_strategy)
      %Ecto.Changeset{data: %MonsterStrategy{}}

  """
  def change_monster_strategy(%MonsterStrategy{} = monster_strategy, attrs \\ %{}) do
    MonsterStrategy.changeset(monster_strategy, attrs)
  end

  alias IomdbEx.Equipment.ResistanceAffect

  @doc """
  Returns the list of resistance_affects.

  ## Examples

      iex> list_resistance_affects()
      [%ResistanceAffect{}, ...]

  """
  def list_resistance_affects do
    Repo.all(ResistanceAffect)
  end

  @doc """
  Gets a single resistance_affect.

  Raises `Ecto.NoResultsError` if the Resistance affect does not exist.

  ## Examples

      iex> get_resistance_affect!(123)
      %ResistanceAffect{}

      iex> get_resistance_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resistance_affect!(id), do: Repo.get!(ResistanceAffect, id)

  @doc """
  Creates a resistance_affect.

  ## Examples

      iex> create_resistance_affect(%{field: value})
      {:ok, %ResistanceAffect{}}

      iex> create_resistance_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resistance_affect(attrs \\ %{}) do
    %ResistanceAffect{}
    |> ResistanceAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resistance_affect.

  ## Examples

      iex> update_resistance_affect(resistance_affect, %{field: new_value})
      {:ok, %ResistanceAffect{}}

      iex> update_resistance_affect(resistance_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resistance_affect(%ResistanceAffect{} = resistance_affect, attrs) do
    resistance_affect
    |> ResistanceAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resistance_affect.

  ## Examples

      iex> delete_resistance_affect(resistance_affect)
      {:ok, %ResistanceAffect{}}

      iex> delete_resistance_affect(resistance_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resistance_affect(%ResistanceAffect{} = resistance_affect) do
    Repo.delete(resistance_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resistance_affect changes.

  ## Examples

      iex> change_resistance_affect(resistance_affect)
      %Ecto.Changeset{data: %ResistanceAffect{}}

  """
  def change_resistance_affect(%ResistanceAffect{} = resistance_affect, attrs \\ %{}) do
    ResistanceAffect.changeset(resistance_affect, attrs)
  end

  alias IomdbEx.Equipment.SkillAffect

  @doc """
  Returns the list of skill_affects.

  ## Examples

      iex> list_skill_affects()
      [%SkillAffect{}, ...]

  """
  def list_skill_affects do
    Repo.all(SkillAffect)
  end

  @doc """
  Gets a single skill_affect.

  Raises `Ecto.NoResultsError` if the Skill affect does not exist.

  ## Examples

      iex> get_skill_affect!(123)
      %SkillAffect{}

      iex> get_skill_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill_affect!(id), do: Repo.get!(SkillAffect, id)

  @doc """
  Creates a skill_affect.

  ## Examples

      iex> create_skill_affect(%{field: value})
      {:ok, %SkillAffect{}}

      iex> create_skill_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill_affect(attrs \\ %{}) do
    %SkillAffect{}
    |> SkillAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill_affect.

  ## Examples

      iex> update_skill_affect(skill_affect, %{field: new_value})
      {:ok, %SkillAffect{}}

      iex> update_skill_affect(skill_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill_affect(%SkillAffect{} = skill_affect, attrs) do
    skill_affect
    |> SkillAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill_affect.

  ## Examples

      iex> delete_skill_affect(skill_affect)
      {:ok, %SkillAffect{}}

      iex> delete_skill_affect(skill_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill_affect(%SkillAffect{} = skill_affect) do
    Repo.delete(skill_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill_affect changes.

  ## Examples

      iex> change_skill_affect(skill_affect)
      %Ecto.Changeset{data: %SkillAffect{}}

  """
  def change_skill_affect(%SkillAffect{} = skill_affect, attrs \\ %{}) do
    SkillAffect.changeset(skill_affect, attrs)
  end

  alias IomdbEx.Equipment.SpellAffect

  @doc """
  Returns the list of spell_affects.

  ## Examples

      iex> list_spell_affects()
      [%SpellAffect{}, ...]

  """
  def list_spell_affects do
    Repo.all(SpellAffect)
  end

  @doc """
  Gets a single spell_affect.

  Raises `Ecto.NoResultsError` if the Spell affect does not exist.

  ## Examples

      iex> get_spell_affect!(123)
      %SpellAffect{}

      iex> get_spell_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spell_affect!(id), do: Repo.get!(SpellAffect, id)

  @doc """
  Creates a spell_affect.

  ## Examples

      iex> create_spell_affect(%{field: value})
      {:ok, %SpellAffect{}}

      iex> create_spell_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spell_affect(attrs \\ %{}) do
    %SpellAffect{}
    |> SpellAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spell_affect.

  ## Examples

      iex> update_spell_affect(spell_affect, %{field: new_value})
      {:ok, %SpellAffect{}}

      iex> update_spell_affect(spell_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spell_affect(%SpellAffect{} = spell_affect, attrs) do
    spell_affect
    |> SpellAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spell_affect.

  ## Examples

      iex> delete_spell_affect(spell_affect)
      {:ok, %SpellAffect{}}

      iex> delete_spell_affect(spell_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spell_affect(%SpellAffect{} = spell_affect) do
    Repo.delete(spell_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spell_affect changes.

  ## Examples

      iex> change_spell_affect(spell_affect)
      %Ecto.Changeset{data: %SpellAffect{}}

  """
  def change_spell_affect(%SpellAffect{} = spell_affect, attrs \\ %{}) do
    SpellAffect.changeset(spell_affect, attrs)
  end

  alias IomdbEx.Equipment.SlotAffect

  @doc """
  Returns the list of slot_affects.

  ## Examples

      iex> list_slot_affects()
      [%SlotAffect{}, ...]

  """
  def list_slot_affects do
    Repo.all(SlotAffect)
  end

  @doc """
  Gets a single slot_affect.

  Raises `Ecto.NoResultsError` if the Slot affect does not exist.

  ## Examples

      iex> get_slot_affect!(123)
      %SlotAffect{}

      iex> get_slot_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slot_affect!(id), do: Repo.get!(SlotAffect, id)

  @doc """
  Creates a slot_affect.

  ## Examples

      iex> create_slot_affect(%{field: value})
      {:ok, %SlotAffect{}}

      iex> create_slot_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slot_affect(attrs \\ %{}) do
    %SlotAffect{}
    |> SlotAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slot_affect.

  ## Examples

      iex> update_slot_affect(slot_affect, %{field: new_value})
      {:ok, %SlotAffect{}}

      iex> update_slot_affect(slot_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slot_affect(%SlotAffect{} = slot_affect, attrs) do
    slot_affect
    |> SlotAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a slot_affect.

  ## Examples

      iex> delete_slot_affect(slot_affect)
      {:ok, %SlotAffect{}}

      iex> delete_slot_affect(slot_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slot_affect(%SlotAffect{} = slot_affect) do
    Repo.delete(slot_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slot_affect changes.

  ## Examples

      iex> change_slot_affect(slot_affect)
      %Ecto.Changeset{data: %SlotAffect{}}

  """
  def change_slot_affect(%SlotAffect{} = slot_affect, attrs \\ %{}) do
    SlotAffect.changeset(slot_affect, attrs)
  end

  alias IomdbEx.Equipment.StatAffect

  @doc """
  Returns the list of stat_affects.

  ## Examples

      iex> list_stat_affects()
      [%StatAffect{}, ...]

  """
  def list_stat_affects do
    Repo.all(StatAffect)
  end

  @doc """
  Gets a single stat_affect.

  Raises `Ecto.NoResultsError` if the Stat affect does not exist.

  ## Examples

      iex> get_stat_affect!(123)
      %StatAffect{}

      iex> get_stat_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stat_affect!(id), do: Repo.get!(StatAffect, id)

  @doc """
  Creates a stat_affect.

  ## Examples

      iex> create_stat_affect(%{field: value})
      {:ok, %StatAffect{}}

      iex> create_stat_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stat_affect(attrs \\ %{}) do
    %StatAffect{}
    |> StatAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stat_affect.

  ## Examples

      iex> update_stat_affect(stat_affect, %{field: new_value})
      {:ok, %StatAffect{}}

      iex> update_stat_affect(stat_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stat_affect(%StatAffect{} = stat_affect, attrs) do
    stat_affect
    |> StatAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stat_affect.

  ## Examples

      iex> delete_stat_affect(stat_affect)
      {:ok, %StatAffect{}}

      iex> delete_stat_affect(stat_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stat_affect(%StatAffect{} = stat_affect) do
    Repo.delete(stat_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stat_affect changes.

  ## Examples

      iex> change_stat_affect(stat_affect)
      %Ecto.Changeset{data: %StatAffect{}}

  """
  def change_stat_affect(%StatAffect{} = stat_affect, attrs \\ %{}) do
    StatAffect.changeset(stat_affect, attrs)
  end

  alias IomdbEx.Equipment.WeaponDamageAffect

  @doc """
  Returns the list of weapon_damage_affects.

  ## Examples

      iex> list_weapon_damage_affects()
      [%WeaponDamageAffect{}, ...]

  """
  def list_weapon_damage_affects do
    Repo.all(WeaponDamageAffect)
  end

  @doc """
  Gets a single weapon_damage_affect.

  Raises `Ecto.NoResultsError` if the Weapon damage affect does not exist.

  ## Examples

      iex> get_weapon_damage_affect!(123)
      %WeaponDamageAffect{}

      iex> get_weapon_damage_affect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_weapon_damage_affect!(id), do: Repo.get!(WeaponDamageAffect, id)

  @doc """
  Creates a weapon_damage_affect.

  ## Examples

      iex> create_weapon_damage_affect(%{field: value})
      {:ok, %WeaponDamageAffect{}}

      iex> create_weapon_damage_affect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_weapon_damage_affect(attrs \\ %{}) do
    %WeaponDamageAffect{}
    |> WeaponDamageAffect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a weapon_damage_affect.

  ## Examples

      iex> update_weapon_damage_affect(weapon_damage_affect, %{field: new_value})
      {:ok, %WeaponDamageAffect{}}

      iex> update_weapon_damage_affect(weapon_damage_affect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_weapon_damage_affect(%WeaponDamageAffect{} = weapon_damage_affect, attrs) do
    weapon_damage_affect
    |> WeaponDamageAffect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a weapon_damage_affect.

  ## Examples

      iex> delete_weapon_damage_affect(weapon_damage_affect)
      {:ok, %WeaponDamageAffect{}}

      iex> delete_weapon_damage_affect(weapon_damage_affect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_weapon_damage_affect(%WeaponDamageAffect{} = weapon_damage_affect) do
    Repo.delete(weapon_damage_affect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking weapon_damage_affect changes.

  ## Examples

      iex> change_weapon_damage_affect(weapon_damage_affect)
      %Ecto.Changeset{data: %WeaponDamageAffect{}}

  """
  def change_weapon_damage_affect(%WeaponDamageAffect{} = weapon_damage_affect, attrs \\ %{}) do
    WeaponDamageAffect.changeset(weapon_damage_affect, attrs)
  end
end
