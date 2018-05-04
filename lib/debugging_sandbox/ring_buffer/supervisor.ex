defmodule DebuggingSandbox.RingBuffer.Supervisor do
  use Supervisor

  alias DebuggingSandbox.RingBuffer

  def start_link(_args) do
    Supervisor.start_link(__MODULE__, _args, [])
  end

  def init(_args) do
    children = [
      Supervisor.child_spec({RingBuffer.Worker, [:alice, :bob]}, id: :alice),
      Supervisor.child_spec({RingBuffer.Worker, [:bob, :carol]}, id: :bob),
      Supervisor.child_spec({RingBuffer.Worker, [:carol, :alice]}, id: :carol)
    ]

    opts = [strategy: :one_for_one]

    Supervisor.init(children, opts)
  end
end
