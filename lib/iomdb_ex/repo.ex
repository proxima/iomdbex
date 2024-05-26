defmodule IomdbEx.Repo do
  use Ecto.Repo,
    otp_app: :iomdb_ex,
    adapter: Ecto.Adapters.MyXQL
end
