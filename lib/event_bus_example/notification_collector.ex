defmodule EventBusExample.NotificationCollector do
  use GenStage

  ## Initialization

  def start_link(_) do
    GenStage.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(queue) do
    {:producer, queue}
  end

  ## API

  def push(event) do
    GenStage.cast(__MODULE__, {:push, event})
  end

  ## Server Callbacks

  def handle_cast({:push, event}, queue) do
    IO.puts "Notification Collector received push event (#{inspect event})..."
    {:noreply, [event], List.insert_at(queue, -1, event)}
  end

  def handle_demand(_, []) do
    {:noreply, [], []}
  end

  def handle_demand(_, [head|tail]) do
    {:noreply, [head], tail}
  end
end