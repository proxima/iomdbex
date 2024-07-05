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
    options = %{sort_by: :name, sort_order: :asc, page: 0, per_page: 50}

    list_equipment_pieces(options)
    |> pieces_with_preloads()
  end

  @doc """
  Returns the list of equipment_pieces given the specified options.

  ## Examples

      iex> list_equipment_pieces()
      [%Piece{}, ...]

  """
  def list_equipment_pieces(options) when is_map(options) do
    query =
      from(Piece)
      |> sort(options)
      |> paginate(options)
      |> Repo.all()

    pieces_with_preloads(query)
  end

  defp pieces_with_preloads(query) do
    Repo.preload(query, pieces_preloads())
  end

  defp pieces_preloads() do
    [
      :equipment_monster,
      [skill_affects: :skill],
      [slot_affects: :slot],
      [spell_affects: :spell],
      [stat_affects: :stat],
      [resistance_affects: :damage_type],
      [weapon_damage_affects: [:weapon_damage_level, :damage_type]]
    ]
  end

  defp sort(query, %{sort_by: sort_by, sort_order: sort_order}) do
    order_by(query, {^sort_order, ^sort_by})
  end

  defp sort(query, _options), do: query

  defp paginate(query, %{page: page, per_page: per_page}) do
    offset = max((page - 1) * per_page, 0)

    query
    |> limit(^per_page)
    |> offset(^offset)
  end

  defp paginate(query, _options), do: query

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
    |> Repo.preload(pieces_preloads())
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
    case %Piece{}
         |> Piece.changeset(attrs)
         |> Repo.insert() do
      {:ok, piece} ->
        {:ok, Repo.preload(piece, pieces_preloads())}

      error ->
        error
    end
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
    case piece
         |> Piece.changeset(attrs)
         |> Repo.update() do
      {:ok, piece} ->
        {:ok, Repo.preload(piece, pieces_preloads())}

      error ->
        error
    end
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
end
