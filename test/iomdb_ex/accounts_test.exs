defmodule IomdbEx.AccountsTest do
  use IomdbEx.DataCase

  alias IomdbEx.Accounts

  describe "admin_users" do
    alias IomdbEx.Accounts.Admin

    import IomdbEx.AccountsFixtures

    @invalid_attrs %{login: nil, hashed_password: nil, email: nil, salt: nil}

    test "list_admin_users/0 returns all admin_users" do
      admin = admin_fixture()
      assert Accounts.list_admin_users() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Accounts.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      valid_attrs = %{
        login: "some login",
        hashed_password: "some hashed_password",
        email: "some email",
        salt: "some salt"
      }

      assert {:ok, %Admin{} = admin} = Accounts.create_admin(valid_attrs)
      assert admin.login == "some login"
      assert admin.hashed_password == "some hashed_password"
      assert admin.email == "some email"
      assert admin.salt == "some salt"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()

      update_attrs = %{
        login: "some updated login",
        hashed_password: "some updated hashed_password",
        email: "some updated email",
        salt: "some updated salt"
      }

      assert {:ok, %Admin{} = admin} = Accounts.update_admin(admin, update_attrs)
      assert admin.login == "some updated login"
      assert admin.hashed_password == "some updated hashed_password"
      assert admin.email == "some updated email"
      assert admin.salt == "some updated salt"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_admin(admin, @invalid_attrs)
      assert admin == Accounts.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Accounts.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_admin(admin)
    end
  end
end
