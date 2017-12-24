defmodule Facsimilie do
  @moduledoc """
  Facsimilie will sync/clone 2 or more mail servers.
  """

  @doc """
  sync will in one step sync x mail servers together, where x is a list of mail servers

  ## Examples
      iex> server_configs = [%{}, %{}]
      iex> Facsimilie.sync(server_configs)
     %{ status: :ok, message: "mail servers synced" }

  """
  def sync(x) do
    %{status: :ok, message: "mail servers synced" }
  end

  @doc """
  new will create a new task to sync the mail servers together

  ## Examples
      iex> Facsimilie.new()
     %{ status: :ok, message: "Task: sync_server_id has been created" }

  """
  def new() do
    %{status: :ok, message: "Task: sync_server_id has been created" }
  end

  @doc """
  add will add a new server to a sync task

  ## Examples
      iex> sync_server_id = "1238-4562-7993-0123"
      iex> mail_server = %{}
      iex> Facsimilie.add(sync_server_id, mail_server)
     %{ status: :ok, message: "Server: mail_server_id was added to Task: sync_server_id" }

  """
  def add(sync_server_id, mail_server) do
    %{status: :ok, message: "Server:  mail_server_id was added to Task: sync_server_id" }
  end
  @doc """
  remove will remove a server from a sync task

  ## Examples
      iex> sync_server_id = "1238-4562-7993-0123"
      iex> mail_server_id = "2222-3333-4444-5555"
      iex> Facsimilie.remove(sync_server_id, mail_server_id)
     %{ status: :ok, message: "Server: mail_server_id was removed from Task: sync_server_id" }

  """
  def remove(sync_server_id, mail_server) do
    %{ status: :ok, message: "Server: mail_server_id was removed from Task: sync_server_id" }
  end

  @doc """
  start will start a sync task

  ## Examples
      iex> sync_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.start(sync_server_id)
     %{ status: :ok, message: "Task: sync_server_id has been started" }

  """
  def start(sync_server_id) do
    %{status: :ok, message:  "Task: sync_server_id has been started" }
  end

  @doc """
  stop will stop a sync task

  ## Examples
      iex> sync_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.stop(sync_server_id)
     %{ status: :ok, message: "Task: sync_server_id has been stopped" }

  """

  def stop(sync_server_id) do
    %{status: :ok, message: "Task: sync_server_id has been stopped" }
  end

  @doc """
  kill will end a sync task

  ## Examples
      iex> sync_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.kill(sync_server_id)
     %{ status: :ok, message: "Task: sync_server_id has been ended" }

  """

  def kill(sync_server_id) do
    %{status: :ok, message: "Task: sync_server_id has been ended" }
  end

end
