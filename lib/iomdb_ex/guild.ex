defmodule IomdbEx.Guild do
  @moduledoc """
  The Guild context.
  """

  import Ecto.Query, warn: false
  alias IomdbEx.Repo

  alias IomdbEx.Guild.Spell

  @doc """
  Returns the list of spells.

  ## Examples

      iex> list_spells()
      [%Spell{}, ...]

  """
  def list_spells do
    Repo.all(Spell)
  end

  @doc """
  Gets a single spell.

  Raises `Ecto.NoResultsError` if the Spell does not exist.

  ## Examples

      iex> get_spell!(123)
      %Spell{}

      iex> get_spell!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spell!(id), do: Repo.get!(Spell, id)

  @doc """
  Creates a spell.

  ## Examples

      iex> create_spell(%{field: value})
      {:ok, %Spell{}}

      iex> create_spell(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spell(attrs \\ %{}) do
    %Spell{}
    |> Spell.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spell.

  ## Examples

      iex> update_spell(spell, %{field: new_value})
      {:ok, %Spell{}}

      iex> update_spell(spell, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spell(%Spell{} = spell, attrs) do
    spell
    |> Spell.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spell.

  ## Examples

      iex> delete_spell(spell)
      {:ok, %Spell{}}

      iex> delete_spell(spell)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spell(%Spell{} = spell) do
    Repo.delete(spell)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spell changes.

  ## Examples

      iex> change_spell(spell)
      %Ecto.Changeset{data: %Spell{}}

  """
  def change_spell(%Spell{} = spell, attrs \\ %{}) do
    Spell.changeset(spell, attrs)
  end

  alias IomdbEx.Guild.Skill

  @doc """
  Returns the list of skills.

  ## Examples

      iex> list_skills()
      [%Skill{}, ...]

  """
  def list_skills do
    Repo.all(Skill)
  end

  @doc """
  Gets a single skill.

  Raises `Ecto.NoResultsError` if the Skill does not exist.

  ## Examples

      iex> get_skill!(123)
      %Skill{}

      iex> get_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill!(id), do: Repo.get!(Skill, id)

  @doc """
  Creates a skill.

  ## Examples

      iex> create_skill(%{field: value})
      {:ok, %Skill{}}

      iex> create_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill.

  ## Examples

      iex> update_skill(skill, %{field: new_value})
      {:ok, %Skill{}}

      iex> update_skill(skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill.

  ## Examples

      iex> delete_skill(skill)
      {:ok, %Skill{}}

      iex> delete_skill(skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill changes.

  ## Examples

      iex> change_skill(skill)
      %Ecto.Changeset{data: %Skill{}}

  """
  def change_skill(%Skill{} = skill, attrs \\ %{}) do
    Skill.changeset(skill, attrs)
  end

  alias IomdbEx.Guild.Type

  @doc """
  Returns the list of guild_types.

  ## Examples

      iex> list_guild_types()
      [%Type{}, ...]

  """
  def list_guild_types do
    Repo.all(Type)
  end

  @doc """
  Gets a single guild_type.

  Raises `Ecto.NoResultsError` if the Guild type does not exist.

  ## Examples

      iex> get_guild_type!(123)
      %Type{}

      iex> get_guild_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guild_type!(id), do: Repo.get!(Type, id)

  @doc """
  Creates a guild_type.

  ## Examples

      iex> create_guild_type(%{field: value})
      {:ok, %Type{}}

      iex> create_guild_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guild_type(attrs \\ %{}) do
    %Type{}
    |> Type.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a guild_type.

  ## Examples

      iex> update_guild_type(guild_type, %{field: new_value})
      {:ok, %Type{}}

      iex> update_guild_type(guild_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guild_type(%Type{} = guild_type, attrs) do
    guild_type
    |> Type.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guild_type.

  ## Examples

      iex> delete_guild_type(guild_type)
      {:ok, %Type{}}

      iex> delete_guild_type(guild_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guild_type(%Type{} = guild_type) do
    Repo.delete(guild_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guild_type changes.

  ## Examples

      iex> change_guild_type(guild_type)
      %Ecto.Changeset{data: %Type{}}

  """
  def change_guild_type(%Type{} = guild_type, attrs \\ %{}) do
    Type.changeset(guild_type, attrs)
  end

  alias IomdbEx.Guild.SkillTrainSpec

  @doc """
  Returns the list of skill_train_specs.

  ## Examples

      iex> list_skill_train_specs()
      [%SkillTrainSpec{}, ...]

  """
  def list_skill_train_specs do
    Repo.all(SkillTrainSpec)
  end

  @doc """
  Gets a single skill_train_spec.

  Raises `Ecto.NoResultsError` if the Skill train spec does not exist.

  ## Examples

      iex> get_skill_train_spec!(123)
      %SkillTrainSpec{}

      iex> get_skill_train_spec!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill_train_spec!(id), do: Repo.get!(SkillTrainSpec, id)

  @doc """
  Creates a skill_train_spec.

  ## Examples

      iex> create_skill_train_spec(%{field: value})
      {:ok, %SkillTrainSpec{}}

      iex> create_skill_train_spec(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill_train_spec(attrs \\ %{}) do
    %SkillTrainSpec{}
    |> SkillTrainSpec.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill_train_spec.

  ## Examples

      iex> update_skill_train_spec(skill_train_spec, %{field: new_value})
      {:ok, %SkillTrainSpec{}}

      iex> update_skill_train_spec(skill_train_spec, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill_train_spec(%SkillTrainSpec{} = skill_train_spec, attrs) do
    skill_train_spec
    |> SkillTrainSpec.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill_train_spec.

  ## Examples

      iex> delete_skill_train_spec(skill_train_spec)
      {:ok, %SkillTrainSpec{}}

      iex> delete_skill_train_spec(skill_train_spec)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill_train_spec(%SkillTrainSpec{} = skill_train_spec) do
    Repo.delete(skill_train_spec)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill_train_spec changes.

  ## Examples

      iex> change_skill_train_spec(skill_train_spec)
      %Ecto.Changeset{data: %SkillTrainSpec{}}

  """
  def change_skill_train_spec(%SkillTrainSpec{} = skill_train_spec, attrs \\ %{}) do
    SkillTrainSpec.changeset(skill_train_spec, attrs)
  end

  alias IomdbEx.Guild.SpellTrainSpec

  @doc """
  Returns the list of spell_train_specs.

  ## Examples

      iex> list_spell_train_specs()
      [%SpellTrainSpec{}, ...]

  """
  def list_spell_train_specs do
    Repo.all(SpellTrainSpec)
  end

  @doc """
  Gets a single spell_train_spec.

  Raises `Ecto.NoResultsError` if the Spell train spec does not exist.

  ## Examples

      iex> get_spell_train_spec!(123)
      %SpellTrainSpec{}

      iex> get_spell_train_spec!(456)
      ** (Ecto.NoResultsError)

  """
  def get_spell_train_spec!(id), do: Repo.get!(SpellTrainSpec, id)

  @doc """
  Creates a spell_train_spec.

  ## Examples

      iex> create_spell_train_spec(%{field: value})
      {:ok, %SpellTrainSpec{}}

      iex> create_spell_train_spec(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_spell_train_spec(attrs \\ %{}) do
    %SpellTrainSpec{}
    |> SpellTrainSpec.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a spell_train_spec.

  ## Examples

      iex> update_spell_train_spec(spell_train_spec, %{field: new_value})
      {:ok, %SpellTrainSpec{}}

      iex> update_spell_train_spec(spell_train_spec, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_spell_train_spec(%SpellTrainSpec{} = spell_train_spec, attrs) do
    spell_train_spec
    |> SpellTrainSpec.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a spell_train_spec.

  ## Examples

      iex> delete_spell_train_spec(spell_train_spec)
      {:ok, %SpellTrainSpec{}}

      iex> delete_spell_train_spec(spell_train_spec)
      {:error, %Ecto.Changeset{}}

  """
  def delete_spell_train_spec(%SpellTrainSpec{} = spell_train_spec) do
    Repo.delete(spell_train_spec)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking spell_train_spec changes.

  ## Examples

      iex> change_spell_train_spec(spell_train_spec)
      %Ecto.Changeset{data: %SpellTrainSpec{}}

  """
  def change_spell_train_spec(%SpellTrainSpec{} = spell_train_spec, attrs \\ %{}) do
    SpellTrainSpec.changeset(spell_train_spec, attrs)
  end
end
