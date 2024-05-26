defmodule IomdbEx.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias IomdbEx.Repo

  alias IomdbEx.Game.DamageLevel

  @doc """
  Returns the list of damage_levels.

  ## Examples

      iex> list_damage_levels()
      [%DamageLevel{}, ...]

  """
  def list_damage_levels do
    Repo.all(DamageLevel)
  end

  @doc """
  Gets a single damage_level.

  Raises `Ecto.NoResultsError` if the Damage level does not exist.

  ## Examples

      iex> get_damage_level!(123)
      %DamageLevel{}

      iex> get_damage_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_damage_level!(id), do: Repo.get!(DamageLevel, id)

  @doc """
  Creates a damage_level.

  ## Examples

      iex> create_damage_level(%{field: value})
      {:ok, %DamageLevel{}}

      iex> create_damage_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_damage_level(attrs \\ %{}) do
    %DamageLevel{}
    |> DamageLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a damage_level.

  ## Examples

      iex> update_damage_level(damage_level, %{field: new_value})
      {:ok, %DamageLevel{}}

      iex> update_damage_level(damage_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_damage_level(%DamageLevel{} = damage_level, attrs) do
    damage_level
    |> DamageLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a damage_level.

  ## Examples

      iex> delete_damage_level(damage_level)
      {:ok, %DamageLevel{}}

      iex> delete_damage_level(damage_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_damage_level(%DamageLevel{} = damage_level) do
    Repo.delete(damage_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking damage_level changes.

  ## Examples

      iex> change_damage_level(damage_level)
      %Ecto.Changeset{data: %DamageLevel{}}

  """
  def change_damage_level(%DamageLevel{} = damage_level, attrs \\ %{}) do
    DamageLevel.changeset(damage_level, attrs)
  end

  alias IomdbEx.Game.AlignmentLevel

  @doc """
  Returns the list of alignment_levels.

  ## Examples

      iex> list_alignment_levels()
      [%AlignmentLevel{}, ...]

  """
  def list_alignment_levels do
    Repo.all(AlignmentLevel)
  end

  @doc """
  Gets a single alignment_level.

  Raises `Ecto.NoResultsError` if the Alignment level does not exist.

  ## Examples

      iex> get_alignment_level!(123)
      %AlignmentLevel{}

      iex> get_alignment_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_alignment_level!(id), do: Repo.get!(AlignmentLevel, id)

  @doc """
  Creates a alignment_level.

  ## Examples

      iex> create_alignment_level(%{field: value})
      {:ok, %AlignmentLevel{}}

      iex> create_alignment_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_alignment_level(attrs \\ %{}) do
    %AlignmentLevel{}
    |> AlignmentLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a alignment_level.

  ## Examples

      iex> update_alignment_level(alignment_level, %{field: new_value})
      {:ok, %AlignmentLevel{}}

      iex> update_alignment_level(alignment_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_alignment_level(%AlignmentLevel{} = alignment_level, attrs) do
    alignment_level
    |> AlignmentLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a alignment_level.

  ## Examples

      iex> delete_alignment_level(alignment_level)
      {:ok, %AlignmentLevel{}}

      iex> delete_alignment_level(alignment_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_alignment_level(%AlignmentLevel{} = alignment_level) do
    Repo.delete(alignment_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking alignment_level changes.

  ## Examples

      iex> change_alignment_level(alignment_level)
      %Ecto.Changeset{data: %AlignmentLevel{}}

  """
  def change_alignment_level(%AlignmentLevel{} = alignment_level, attrs \\ %{}) do
    AlignmentLevel.changeset(alignment_level, attrs)
  end

  alias IomdbEx.Game.DamageType

  @doc """
  Returns the list of damage_types.

  ## Examples

      iex> list_damage_types()
      [%DamageType{}, ...]

  """
  def list_damage_types do
    Repo.all(DamageType)
  end

  @doc """
  Gets a single damage_type.

  Raises `Ecto.NoResultsError` if the Damage type does not exist.

  ## Examples

      iex> get_damage_type!(123)
      %DamageType{}

      iex> get_damage_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_damage_type!(id), do: Repo.get!(DamageType, id)

  @doc """
  Creates a damage_type.

  ## Examples

      iex> create_damage_type(%{field: value})
      {:ok, %DamageType{}}

      iex> create_damage_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_damage_type(attrs \\ %{}) do
    %DamageType{}
    |> DamageType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a damage_type.

  ## Examples

      iex> update_damage_type(damage_type, %{field: new_value})
      {:ok, %DamageType{}}

      iex> update_damage_type(damage_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_damage_type(%DamageType{} = damage_type, attrs) do
    damage_type
    |> DamageType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a damage_type.

  ## Examples

      iex> delete_damage_type(damage_type)
      {:ok, %DamageType{}}

      iex> delete_damage_type(damage_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_damage_type(%DamageType{} = damage_type) do
    Repo.delete(damage_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking damage_type changes.

  ## Examples

      iex> change_damage_type(damage_type)
      %Ecto.Changeset{data: %DamageType{}}

  """
  def change_damage_type(%DamageType{} = damage_type, attrs \\ %{}) do
    DamageType.changeset(damage_type, attrs)
  end

  alias IomdbEx.Game.HungerLevel

  @doc """
  Returns the list of hunger_levels.

  ## Examples

      iex> list_hunger_levels()
      [%HungerLevel{}, ...]

  """
  def list_hunger_levels do
    Repo.all(HungerLevel)
  end

  @doc """
  Gets a single hunger_level.

  Raises `Ecto.NoResultsError` if the Hunger level does not exist.

  ## Examples

      iex> get_hunger_level!(123)
      %HungerLevel{}

      iex> get_hunger_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hunger_level!(id), do: Repo.get!(HungerLevel, id)

  @doc """
  Creates a hunger_level.

  ## Examples

      iex> create_hunger_level(%{field: value})
      {:ok, %HungerLevel{}}

      iex> create_hunger_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hunger_level(attrs \\ %{}) do
    %HungerLevel{}
    |> HungerLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hunger_level.

  ## Examples

      iex> update_hunger_level(hunger_level, %{field: new_value})
      {:ok, %HungerLevel{}}

      iex> update_hunger_level(hunger_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hunger_level(%HungerLevel{} = hunger_level, attrs) do
    hunger_level
    |> HungerLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hunger_level.

  ## Examples

      iex> delete_hunger_level(hunger_level)
      {:ok, %HungerLevel{}}

      iex> delete_hunger_level(hunger_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hunger_level(%HungerLevel{} = hunger_level) do
    Repo.delete(hunger_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hunger_level changes.

  ## Examples

      iex> change_hunger_level(hunger_level)
      %Ecto.Changeset{data: %HungerLevel{}}

  """
  def change_hunger_level(%HungerLevel{} = hunger_level, attrs \\ %{}) do
    HungerLevel.changeset(hunger_level, attrs)
  end

  alias IomdbEx.Game.Stat

  @doc """
  Returns the list of stats.

  ## Examples

      iex> list_stats()
      [%Stat{}, ...]

  """
  def list_stats do
    Repo.all(Stat)
  end

  @doc """
  Gets a single stat.

  Raises `Ecto.NoResultsError` if the Stat does not exist.

  ## Examples

      iex> get_stat!(123)
      %Stat{}

      iex> get_stat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stat!(id), do: Repo.get!(Stat, id)

  @doc """
  Creates a stat.

  ## Examples

      iex> create_stat(%{field: value})
      {:ok, %Stat{}}

      iex> create_stat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stat(attrs \\ %{}) do
    %Stat{}
    |> Stat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stat.

  ## Examples

      iex> update_stat(stat, %{field: new_value})
      {:ok, %Stat{}}

      iex> update_stat(stat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stat(%Stat{} = stat, attrs) do
    stat
    |> Stat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stat.

  ## Examples

      iex> delete_stat(stat)
      {:ok, %Stat{}}

      iex> delete_stat(stat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stat(%Stat{} = stat) do
    Repo.delete(stat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stat changes.

  ## Examples

      iex> change_stat(stat)
      %Ecto.Changeset{data: %Stat{}}

  """
  def change_stat(%Stat{} = stat, attrs \\ %{}) do
    Stat.changeset(stat, attrs)
  end

  alias IomdbEx.Game.Slot

  @doc """
  Returns the list of slots.

  ## Examples

      iex> list_slots()
      [%Slot{}, ...]

  """
  def list_slots do
    Repo.all(Slot)
  end

  @doc """
  Gets a single slot.

  Raises `Ecto.NoResultsError` if the Slot does not exist.

  ## Examples

      iex> get_slot!(123)
      %Slot{}

      iex> get_slot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slot!(id), do: Repo.get!(Slot, id)

  @doc """
  Creates a slot.

  ## Examples

      iex> create_slot(%{field: value})
      {:ok, %Slot{}}

      iex> create_slot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slot(attrs \\ %{}) do
    %Slot{}
    |> Slot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slot.

  ## Examples

      iex> update_slot(slot, %{field: new_value})
      {:ok, %Slot{}}

      iex> update_slot(slot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slot(%Slot{} = slot, attrs) do
    slot
    |> Slot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a slot.

  ## Examples

      iex> delete_slot(slot)
      {:ok, %Slot{}}

      iex> delete_slot(slot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slot(%Slot{} = slot) do
    Repo.delete(slot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slot changes.

  ## Examples

      iex> change_slot(slot)
      %Ecto.Changeset{data: %Slot{}}

  """
  def change_slot(%Slot{} = slot, attrs \\ %{}) do
    Slot.changeset(slot, attrs)
  end

  alias IomdbEx.Game.StatLevel

  @doc """
  Returns the list of stat_levels.

  ## Examples

      iex> list_stat_levels()
      [%StatLevel{}, ...]

  """
  def list_stat_levels do
    Repo.all(StatLevel)
  end

  @doc """
  Gets a single stat_level.

  Raises `Ecto.NoResultsError` if the Stat level does not exist.

  ## Examples

      iex> get_stat_level!(123)
      %StatLevel{}

      iex> get_stat_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stat_level!(id), do: Repo.get!(StatLevel, id)

  @doc """
  Creates a stat_level.

  ## Examples

      iex> create_stat_level(%{field: value})
      {:ok, %StatLevel{}}

      iex> create_stat_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stat_level(attrs \\ %{}) do
    %StatLevel{}
    |> StatLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stat_level.

  ## Examples

      iex> update_stat_level(stat_level, %{field: new_value})
      {:ok, %StatLevel{}}

      iex> update_stat_level(stat_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stat_level(%StatLevel{} = stat_level, attrs) do
    stat_level
    |> StatLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stat_level.

  ## Examples

      iex> delete_stat_level(stat_level)
      {:ok, %StatLevel{}}

      iex> delete_stat_level(stat_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stat_level(%StatLevel{} = stat_level) do
    Repo.delete(stat_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stat_level changes.

  ## Examples

      iex> change_stat_level(stat_level)
      %Ecto.Changeset{data: %StatLevel{}}

  """
  def change_stat_level(%StatLevel{} = stat_level, attrs \\ %{}) do
    StatLevel.changeset(stat_level, attrs)
  end

  alias IomdbEx.Game.Race

  @doc """
  Returns the list of races.

  ## Examples

      iex> list_races()
      [%Race{}, ...]

  """
  def list_races do
    Repo.all(Race)
  end

  @doc """
  Gets a single race.

  Raises `Ecto.NoResultsError` if the Race does not exist.

  ## Examples

      iex> get_race!(123)
      %Race{}

      iex> get_race!(456)
      ** (Ecto.NoResultsError)

  """
  def get_race!(id), do: Repo.get!(Race, id)

  @doc """
  Creates a race.

  ## Examples

      iex> create_race(%{field: value})
      {:ok, %Race{}}

      iex> create_race(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_race(attrs \\ %{}) do
    %Race{}
    |> Race.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a race.

  ## Examples

      iex> update_race(race, %{field: new_value})
      {:ok, %Race{}}

      iex> update_race(race, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_race(%Race{} = race, attrs) do
    race
    |> Race.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a race.

  ## Examples

      iex> delete_race(race)
      {:ok, %Race{}}

      iex> delete_race(race)
      {:error, %Ecto.Changeset{}}

  """
  def delete_race(%Race{} = race) do
    Repo.delete(race)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking race changes.

  ## Examples

      iex> change_race(race)
      %Ecto.Changeset{data: %Race{}}

  """
  def change_race(%Race{} = race, attrs \\ %{}) do
    Race.changeset(race, attrs)
  end
end
