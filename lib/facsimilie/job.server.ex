defmodule Facsimilie.Job.Server do
  require Logger

  use GenServer


  @moduledoc """
  A genserver to represent a job server.
  """

  @name __MODULE__
  @registry_name :job_server_registry

  #a  struct to manage the state for this genserver
  defstruct id: nil,
            settings: nil,
            servers: []

  ## Server API


  @doc "Start the server"
  def start_link(id) do

    name = via_tuple(id)

    GenServer.start_link(__MODULE__, [id], name: name)

  end

  @doc "Get the id of the job server from the registry"
  defp via_tuple(id) do

    {:via, Registry, {@registry_name, id}}
  end


  def init(_) do

    {:ok, nil}
  end


  @doc "add a mail server to the job"
  def add(id, config)do

    GenServer.call(via_tuple(id), {:add, config })
  end

  @doc "remove a mail server from the job"
  def remove(id, mail_server_id)do

    GenServer.call(via_tuple(id), {:remove, mail_server_id })
  end


  def handle_call({:add, server_config }, _from, %__MODULE__{servers: servers } = state) do

    {_, server} = Facsimilie.Mail.Supervisor.start()
    Facsimilie.Mail.Server.configure(server, server_config)

    servers = servers ++ [server]
    updated_state =  %__MODULE__{ state |  servers: servers }

    {:reply, updated_state, updated_state}
  end

  def handle_call({:remove, mail_server_id }, _from, %__MODULE__{servers: servers } = state) do

    Facsimilie.Mail.Supervisor.kill(mail_server_id)

    servers = List.delete(servers, mail_server_id)
    updated_state =  %__MODULE__{ state |  servers: servers }

    {:reply, updated_state, updated_state}
  end

end