defmodule IomdbEx.EquipmentListFixtures do
  alias IomdbEx.{AccountsFixtures, EquipmentFixtures}

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
    admin_user = AccountsFixtures.admin_fixture()
    type = type_fixture()

    attrs =
      Map.merge(attrs, %{admin_user_id: admin_user.id, equipment_piece_list_type_id: type.id})

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
    list = list_fixture()
    piece = EquipmentFixtures.piece_fixture()

    attrs = Map.merge(attrs, %{equipment_piece_list_id: list.id, equipment_piece_id: piece.id})

    {:ok, entry} =
      attrs
      |> Enum.into(%{
        dicer: "some dicer"
      })
      |> IomdbEx.EquipmentList.create_entry()

    entry
  end
end
