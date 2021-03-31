defmodule Todo.Lists.Commands.EditTodoItem do
  defstruct item_uuid: "",
            new_task: ""

  use ExConstructor
end
