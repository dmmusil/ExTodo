defmodule Todo.Lists.Events.TodoItemEdited do
  @derive Jason.Encoder
  defstruct [
    :item_uuid,
    :new_task
  ]
end
