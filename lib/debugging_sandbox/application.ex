defmodule DebuggingSandbox.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    secret_state_flag = System.get_env("SECRET_STATE_FLAG")

    children = [
      DebuggingSandbox.RingBuffer.Supervisor,
      {DebuggingSandbox.SecretState, [secret_state_flag]}
    ]

    opts = [strategy: :one_for_one, name: DebuggingSandbox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
