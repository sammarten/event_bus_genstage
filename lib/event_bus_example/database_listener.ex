defmodule EventBusExample.DatabaseListener do
  use GenServer

  alias EventBusExample.DatabaseCollector

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def process(event_shadow) do
    IO.puts "Database Listener received event shadow (#{inspect event_shadow})..."
    GenServer.cast(__MODULE__, event_shadow)
    :ok
  end

  def handle_cast(event_shadow, state) do
    event = EventBus.fetch_event(event_shadow)
    :ok = DatabaseCollector.push(event)
    EventBus.mark_as_completed({__MODULE__, event_shadow})
    {:noreply, state}
  end
end