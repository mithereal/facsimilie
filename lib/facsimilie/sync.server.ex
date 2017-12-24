defmodule Facsimilie.Sync.Server do
  require Logger

  use GenServer


  @moduledoc """
  A genserver to represent a sync servers task.
  """

  @name __MODULE__
  @registry_name :sync_server_registry

  ## Server API


  @doc "Start the server"
  def start_link(id) do

    name = via_tuple(id)

    GenServer.start_link(__MODULE__, [id], name: name)

  end

  @doc "Get the id of the quote from the registry"
  defp via_tuple(id) do

    {:via, Registry, {@registry_name, id}}
  end


  def init(_) do

    {:ok, nil}
  end

end