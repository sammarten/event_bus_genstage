defmodule EventBusExample.Application do
  use Application

  def start(_type, _args) do
    EventBus.subscribe({EventBusExample.DatabaseListener, ["step_started", "step_ended"]})
    EventBus.subscribe({EventBusExample.NotificationListener, [".*"]})

    children = [
      EventBusExample.DatabaseListener,
      EventBusExample.DatabaseCollector,
      EventBusExample.Persister,
      EventBusExample.NotificationListener,
      EventBusExample.NotificationCollector,
      EventBusExample.Notifier
    ]

    opts = [strategy: :one_for_one, name: EventBusExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
