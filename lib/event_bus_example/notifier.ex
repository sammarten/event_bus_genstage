defmodule EventBusExample.Notifier do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :no_state, name: __MODULE__)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [EventBusExample.NotificationCollector]}
  end

  def handle_events([event], _from, state) do
    IO.puts "Notifying event #{inspect event}..."
    :timer.sleep(3000)
    IO.puts "Notified event #{event.id}."
    {:noreply, [], state}
  end
end