defmodule Facsimilie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Facsimilie.Worker.start_link(arg)
      # {Facsimilie.Worker, arg},
      # setup Registries
      supervisor(Registry, [:unique, :sync_server_registry], id: :sync_server_registry),
      supervisor(Registry, [:unique, :mail_server_registry], id: :mail_server_registry),
      supervisor(Registry, [:unique, :job_server_registry], id: :job_server_registry),
      #setup server supervisors
      supervisor(Facsimilie.Job.Supervisor, []),
      supervisor(Facsimilie.Mail.Supervisor, []),
      supervisor(Facsimilie.Sync.Supervisor, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Facsimilie.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
