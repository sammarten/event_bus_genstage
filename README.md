# Event Bus with GenStage Example

**Using a GenStage pipeline to process events published from Event Bus**

## Overview

This is a pretty cool way to handle processing of various events across the system. Any process can notify the Event Bus that something has occurred. Subscribed listener processes will receive that notification and can do with it whatever they want. What I am exploring here is a way to add Database and Notification process handlers to the Event Bus. The logic for them is completely decoupled. They each need a listener and then a producer and consumer to process the messages they receive.

## To Run

```elixir
mix deps.get

mix compile
```

Once compiled, run `iex -S mix` to start the application in a command shell.

At the command prompt, you can run these statements to send messages around the Event Bus and see them processed through GenStage pipelines.

```elixir
alias EventBus.Model.Event

event = %Event{id: "1", topic: :step_started, data: %{message: "X Step Started"}}
:ok = EventBus.notify(event)

event = %Event{id: "2", topic: :step_updated, data: %{message: "X Step Updated"}}
:ok = EventBus.notify(event)

event = %Event{id: "3", topic: :step_ended, data: %{message: "X Step Ended"}}
:ok = EventBus.notify(event)
```