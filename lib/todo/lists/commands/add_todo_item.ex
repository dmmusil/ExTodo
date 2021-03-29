defmodule Todo.Lists.Commands.AddTodoItem do
  defstruct item_uuid: "",
            task: "",
            list_uuid: ""

  use ExConstructor
  alias Todo.Lists.Commands.AddTodoItem

  def assign_uuid(%AddTodoItem{} = add, uuid) do
    %AddTodoItem{add | item_uuid: uuid}
  end

  def assign_task(%AddTodoItem{task: task} = add) do
    %AddTodoItem{add | task: task}
  end

  def assign_list_uuid(%AddTodoItem{list_uuid: uuid} = add) do
    %AddTodoItem{add | list_uuid: uuid}
  end
end
