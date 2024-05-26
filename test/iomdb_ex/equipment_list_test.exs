defmodule IomdbEx.EquipmentListTest do
  use IomdbEx.DataCase

  alias IomdbEx.EquipmentList

  describe "equipment_piece_list_types" do
    alias IomdbEx.EquipmentList.Type

    import IomdbEx.EquipmentListFixtures

    @invalid_attrs %{name: nil}

    test "list_equipment_piece_list_types/0 returns all equipment_piece_list_types" do
      type = type_fixture()
      assert EquipmentList.list_equipment_piece_list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert EquipmentList.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Type{} = type} = EquipmentList.create_type(valid_attrs)
      assert type.name == "some name"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EquipmentList.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Type{} = type} = EquipmentList.update_type(type, update_attrs)
      assert type.name == "some updated name"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = EquipmentList.update_type(type, @invalid_attrs)
      assert type == EquipmentList.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = EquipmentList.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> EquipmentList.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = EquipmentList.change_type(type)
    end
  end

  describe "equipment_piece_lists" do
    alias IomdbEx.EquipmentList.List

    import IomdbEx.EquipmentListFixtures

    @invalid_attrs %{name: nil}

    test "list_equipment_piece_lists/0 returns all equipment_piece_lists" do
      list = list_fixture()
      assert EquipmentList.list_equipment_piece_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert EquipmentList.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %List{} = list} = EquipmentList.create_list(valid_attrs)
      assert list.name == "some name"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EquipmentList.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %List{} = list} = EquipmentList.update_list(list, update_attrs)
      assert list.name == "some updated name"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = EquipmentList.update_list(list, @invalid_attrs)
      assert list == EquipmentList.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = EquipmentList.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> EquipmentList.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = EquipmentList.change_list(list)
    end
  end

  describe "equipment_piece_list_entries" do
    alias IomdbEx.EquipmentList.Entry

    import IomdbEx.EquipmentListFixtures

    @invalid_attrs %{dicer: nil}

    test "list_equipment_piece_list_entries/0 returns all equipment_piece_list_entries" do
      entry = entry_fixture()
      assert EquipmentList.list_equipment_piece_list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert EquipmentList.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      valid_attrs = %{dicer: "some dicer"}

      assert {:ok, %Entry{} = entry} = EquipmentList.create_entry(valid_attrs)
      assert entry.dicer == "some dicer"
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EquipmentList.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      update_attrs = %{dicer: "some updated dicer"}

      assert {:ok, %Entry{} = entry} = EquipmentList.update_entry(entry, update_attrs)
      assert entry.dicer == "some updated dicer"
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = EquipmentList.update_entry(entry, @invalid_attrs)
      assert entry == EquipmentList.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = EquipmentList.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> EquipmentList.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = EquipmentList.change_entry(entry)
    end
  end
end
