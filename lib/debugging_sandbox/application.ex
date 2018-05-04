defmodule DebuggingSandbox.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      DebuggingSandbox.RingBuffer.Supervisor
    ]

    opts = [strategy: :one_for_one, name: DebuggingSandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
