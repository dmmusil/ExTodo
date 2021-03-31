defmodule Todo.Lists.Commands.AddTodoItem do
  defstruct item_uuid: "",
            task: "",
            list_uuid: ""

  use ExConstructor
  alias Todo.Lists.Commands.AddTodoItem

  def assign_uuid(%AddTodoItem{} = add, uuid) do
    %AddTodoItem{add | item_uuid: uuid}
  end
end
