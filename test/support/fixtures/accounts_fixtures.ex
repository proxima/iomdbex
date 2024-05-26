defmodule IomdbEx.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IomdbEx.Accounts` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hashed_password: "some hashed_password",
        login: "some login",
        salt: "some salt"
      })
      |> IomdbEx.Accounts.create_admin()

    admin
  end
end
