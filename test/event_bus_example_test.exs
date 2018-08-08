defmodule EventBusExampleTest do
  use ExUnit.Case
  doctest EventBusExample

  test "greets the world" do
    assert EventBusExample.hello() == :world
  end
end
