defmodule DebuggingSandbox.SecretState do
  use GenServer

  def start_link([flag]) do
    GenServer.start_link(__MODULE__, flag, name: __MODULE__)
  end

  def init(flag) do
    {:ok, flag}
  end
end
