defmodule Todo.Lists.Events.TodoItemAdded do
  @derive Jason.Encoder
  defstruct [
    :item_uuid,
    :task,
    :list_uuid
  ]
end
