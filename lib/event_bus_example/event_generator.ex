# defmodule EventBusExample.EventGenerator do
#   alias EventBus.Model.Event

#   def generate() do
    
    
#     event = %Event{id: "123", transaction_id: "1",
#       topic: :hello, data: %{message: "Hello"}}

#     EventBus.notify(event)
#   end

#   def two() do
#     event = %Event{id: "124", transaction_id: "1",
#       topic: :goodbye, data: %{message: "Goodbye"}}

#     EventBus.notify(event)
#   end

#   def three() do
#     event = %Event{id: "125", transaction_id: "1",
#       topic: :yolo, data: %{message: "Yolo"}}

#     EventBus.notify(event)
#   end
# end