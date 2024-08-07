defmodule Infox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Commanded app
      Infox.App,
      InfoxWeb.Telemetry,

      # Start the Ecto repository
      Infox.Repo,
      {DNSCluster, query: Application.get_env(:infox, :dns_cluster_query) || :ignore},

      # Start the Phoenix PubSub system
      {Phoenix.PubSub, name: Infox.PubSub},

      # Start the Finch HTTP client for sending emails
      {Finch, name: Infox.Finch},

      # Start a worker by calling: Infox.Worker.start_link(arg)
      # {Infox.Worker, arg},
      # Start to serve requests, typically the last entry
      InfoxWeb.Endpoint,

      # Accounts Supervisor
      Infox.Accounts.Supervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Infox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InfoxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
