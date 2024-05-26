defmodule IomdbEx.EquipmentListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.EquipmentList` context.
  """

  @doc """
  Generate a type.
  """
  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> IomdbEx.EquipmentList.create_type()

    type
  end

  @doc """
  Generate a list.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> IomdbEx.EquipmentList.create_list()

    list
  end

  @doc """
  Generate a entry.
  """
  def entry_fixture(attrs \\ %{}) do
    {:ok, entry} =
      attrs
      |> Enum.into(%{
        dicer: "some dicer"
      })
      |> IomdbEx.EquipmentList.create_entry()

    entry
  end
end
