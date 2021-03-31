defmodule Todo.Lists.Events.TodoItemCompleted do
  @derive Jason.Encoder
  defstruct [
    :item_uuid
  ]
end
