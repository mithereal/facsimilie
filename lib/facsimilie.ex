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
    status = Facsimilie.Job.Supervisor.start()

    %{status: :ok, message: "mail servers synced" }
  end

  @doc """
  new will create a new task to sync the mail servers together

  ## Examples
      iex> Facsimilie.new()
     %{ status: :ok, message: "Task: job server has been created" }

  """
  def new() do
    status = Facsimilie.Job.Supervisor.start()

    case status do
     {:ok,_} -> %{status: :ok, message: "Task: job server has been created" }
     {:error, error} -> %{status: :error, message: "An Error Occured: " <> error }
      end

  end

  @doc """
  add will add a new server to a job task

  ## Examples
      iex> job_server_id = "1238-4562-7993-0123"
      iex> mail_server = %{}
      iex> Facsimilie.add(job_server_id, mail_server)
     %{ status: :ok, message: "Server: mail_server_id was added" }

  """
  def add(job_server_id, mail_server) do
    status = Facsimilie.Job.Server.add(job_server_id, mail_server)

    case status do
      {:ok,_} -> %{status: :ok, message: "Task: mail server has been added" }
      {:error, error} -> %{status: :error, message: "An Error Occured: " <> error }
    end

  end
  @doc """
  remove will remove a server from a job task

  ## Examples
      iex> job_server_id = "1238-4562-7993-0123"
      iex> mail_server_id = "2222-3333-4444-5555"
      iex> Facsimilie.remove(sync_server_id, mail_server_id)
     %{ status: :ok, message: "Server: mail_server_id was removed from Task: sync_server_id" }

  """
  def remove(job_server_id, mail_server) do
    status = Facsimilie.Job.Server.remove(job_server_id, mail_server)

    case status do
      {:ok,_} -> %{ status: :ok, message: "Server: mail_server_id was removed from Task: job_server_id" }
      {:error, error} -> %{status: :error, message: "An Error Occured: " <> error }
    end


  end

  @doc """
  start will start/resume a job task

  ## Examples
   iex> job_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.start()
     %{ status: :ok, message: "Task: job_server_id has been started" }

  """
  def start() do
    status = Facsimilie.Job.Server.start(job_server_id)

    case status do
      {:ok,_} -> %{status: :ok, message: "Task: job server has been created" }
      {:error, error} -> %{status: :error, message: "An Error Occured: " <> error }
    end

  end

  @doc """
  stop will stop/pause a job task

  ## Examples
      iex> job_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.stop(sync_server_id)
     %{ status: :ok, message: "Task: job_server_id has been stopped" }

  """

  def stop(job_server_id) do
    status = Facsimilie.Job.Server.stop(job_server_id)

    case status do
      {:ok,_} -> %{status: :ok, message: "Task: job server has been created" }
      {:error, error} -> %{status: :error, message: "An Error Occured: " <> error }
    end

    %{status: :ok, message: "Task: job_server_id has been stopped" }
  end

  @doc """
  kill will end a job task

  ## Examples
      iex> job_server_id = "1238-4562-7993-0123"
      iex> Facsimilie.kill(job_server_id)
     %{ status: :ok, message: "Task: sync_server_id has been ended" }

  """

  def kill(job_server_id) do
    status = Facsimilie.Job.Supervisor.stop(job_server_id)
    %{status: :ok, message: "Task: job_server_id has been ended" }
  end

end
