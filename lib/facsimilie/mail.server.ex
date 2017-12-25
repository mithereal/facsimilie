defmodule Facsimilie.Mail.Server do
  require Logger

  use GenServer


  @moduledoc """
  A genserver to represent a mail server.
  """

  @name __MODULE__
  @registry_name :mail_server_registry


  #a  struct to manage the state for this genserver
  defstruct id: nil,
  settings: nil,
  headers: []

  ## Server API


  @doc "Start the server"
  def start_link(id) do

    name = via_tuple(id)

    GenServer.start_link(__MODULE__, [id], name: name)

  end

  @doc "Get the id of the mail server from the registry"
  defp via_tuple(id) do

    {:via, Registry, {@registry_name, id}}
  end


  def init(_) do

    {:ok, nil}
  end

  @doc "set up the mailserver settings, host, username, etc"
  def configure(x)do

    GenServer.call(via_tuple(id), {:add, config })
  end

  @doc "fetch the headers from the mail server"
  def fetch_headers(x)do

    GenServer.call(via_tuple(id), {:fetch_headers})
  end

  @doc "clear all the recieved headers"
  def clear_headers(x)do

    GenServer.call(via_tuple(id), {:clear_headers})
  end

  def handle_call({:clear_headers}, _from, %__MODULE__{headers: headers } = state) do

    updated_state =  %__MODULE__{ state |  headers: [] }

    {:reply, updated_state, updated_state}
  end

  def handle_call({:fetch_headers}, _from, %__MODULE__{headers: headers } = state) do

    fetched = []
    updated_state =  %__MODULE__{ state |  headers: [] }

    {:reply, updated_state, updated_state}
  end

end