defmodule DebuggingSandboxTest do
  use ExUnit.Case
  doctest DebuggingSandbox

  test "greets the world" do
    assert DebuggingSandbox.hello() == :world
  end
end
