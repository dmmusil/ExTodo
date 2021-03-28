defmodule Todo.Router do
  use Commanded.Commands.Router

  alias Todo.Lists.Aggregates.TodoItem

  alias Todo.Lists.Commands.{
    AddTodoItem
  }

  identify(TodoItem, by: :item_uuid, prefix: "item-")

  dispatch(
    [
      AddTodoItem
    ],
    to: TodoItem
  )
end
