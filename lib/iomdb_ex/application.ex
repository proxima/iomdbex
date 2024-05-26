defmodule IomdbEx.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IomdbExWeb.Telemetry,
      IomdbEx.Repo,
      {DNSCluster, query: Application.get_env(:iomdb_ex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: IomdbEx.PubSub},
      {Finch, name: IomdbEx.Finch},
      IomdbExWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: IomdbEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    IomdbExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
