defmodule Facsimilie.Sync.Server do
  require Logger

  use GenServer


  @moduledoc """
  A genserver to represent a sync servers task.
  """

  @name __MODULE__

  ## Server API

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def init(_) do

    {:ok, %__MODULE__{}}
  end

end