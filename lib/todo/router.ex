defmodule Todo.Router do
  use Commanded.Commands.Router

  alias Todo.Lists.Aggregates.TodoItem

  alias Todo.Lists.Commands.{
    AddTodoItem,
    EditTodoItem,
    CompleteTodoItem
  }

  identify(TodoItem, by: :item_uuid, prefix: "item-")

  dispatch(
    [
      AddTodoItem,
      EditTodoItem,
      CompleteTodoItem
    ],
    to: TodoItem
  )
end
