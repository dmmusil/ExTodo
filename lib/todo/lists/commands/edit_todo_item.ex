defmodule Todo.Lists.Commands.EditTodoItem do
  defstruct item_uuid: "",
            new_task: ""

  use ExConstructor
  alias Todo.Lists.Commands.EditTodoItem

  def assign_uuid(%EditTodoItem{item_uuid: uuid} = add) do
    %EditTodoItem{add | item_uuid: uuid}
  end

  def assign_task(%EditTodoItem{new_task: task} = add) do
    %EditTodoItem{add | new_task: task}
  end
end
