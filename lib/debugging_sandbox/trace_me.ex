defmodule DebuggingSandbox.TraceMe do
  use GenServer

  @name __MODULE__

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def init([]) do
    {:ok, []}
  end

  def boop do
    GenServer.call(@name, :boop)
  end

  def handle_call(:boop, _from, state) do
    echo(System.get_env("FUNCTION_TRACE_FLAG"))

    {:reply, :ok, state}
  end

  defp echo(key) do
    key
  end
end
