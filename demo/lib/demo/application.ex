defmodule Demo.Firestore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Demo.Firestore.Repo,
      # Start the Telemetry supervisor
      Demo.FirestoreWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Demo.Firestore.PubSub},
      # Start the Endpoint (http/https)
      Demo.FirestoreWeb.Endpoint
      # Start a worker by calling: Demo.Firestore.Worker.start_link(arg)
      # {Demo.Firestore.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Demo.Firestore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Demo.FirestoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
