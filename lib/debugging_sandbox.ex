defmodule DebuggingSandbox do
  @moduledoc false

  def initialize_ring_buffer do
    flag = System.get_env("RING_BUFFER_FLAG")

    send :alice, flag

    :ok
  end
end
