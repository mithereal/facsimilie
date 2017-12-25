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

end