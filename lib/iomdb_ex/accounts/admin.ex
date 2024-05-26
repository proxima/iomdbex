defmodule IomdbEx.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_users" do
    field :login, :string
    field :hashed_password, :string, redact: true
    field :email, :string
    field :salt, :string, redact: true

    timestamps(type: :utc_datetime, inserted_at: :created_at)
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:login, :hashed_password, :email, :salt])
    |> validate_required([:login, :hashed_password, :email, :salt])
    |> unique_constraint(:login)
  end
end
