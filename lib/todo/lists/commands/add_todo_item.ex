defmodule Todo.Lists.Commands.AddTodoItem do
  defstruct item_uuid: "",
            task: "",
            list_uuid: ""

  use ExConstructor
end
