defmodule Facsimilie.Sync.Supervisor do
  use Supervisor
  require Logger

  @registry_name :sync_server_registry

  def start_link do
    Supervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def start(x) do
    Supervisor.start_child(__MODULE__, [ x ])
  end

  def stop(x) do
    case Registry.lookup(@registry_name,  x) do
      [] -> :ok
      [{pid, _}] ->
        Process.exit(pid, :shutdown)
        :ok
    end
  end

  def init(_) do
    children = [worker(Facsimilie.Sync.Server, [], restart: :transient)]
    supervise(children, [strategy: :simple_one_for_one])
  end

  def find_or_create_process(x)  do
    if process_exists?(x) do
      {:ok, x}
    else
      x |> start_quote
    end
  end

  def process_exists?(x)  do
    case Registry.lookup(@registry_name, x) do
      [] -> false
      _ -> true
    end
  end

  def server_ids do
    Supervisor.which_children(__MODULE__)
    |> Enum.map(fn {_, account_proc_pid, _, _} ->
      Registry.keys(@registry_name, account_proc_pid)
      |> List.first
    end)
    |> Enum.sort
  end
end