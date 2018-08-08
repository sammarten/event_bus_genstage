defmodule EventBusExample.Persister do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :no_state, name: __MODULE__)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [EventBusExample.DatabaseCollector]}
  end

  def handle_events([event], _from, state) do
    IO.puts "Saving event #{inspect event}..."
    :timer.sleep(10_000)
    IO.puts "Saved event #{event.id}."
    {:noreply, [], state}
  end
end