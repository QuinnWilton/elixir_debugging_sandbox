defmodule DebuggingSandbox.RingBuffer.Worker do
  use GenServer

  @delivery_delay_ms 1000

  def start_link([name, target]) do
    GenServer.start_link(__MODULE__, target, [name: name])
  end

  def init(target) do
    {:ok, target}
  end

  def handle_info(message, target) do
    Process.send_after(target, message, @delivery_delay_ms)

    {:noreply, target}
  end
end
