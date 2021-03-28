defmodule Todo.Lists do
  alias Todo.Lists.Commands.{
    AddTodoItem
  }

  def add_todo_item(attrs \\ %{}) do
    uuid = UUID.uuid4()

    add_todo_item =
      attrs
      |> AddTodoItem.new()
  end
end
