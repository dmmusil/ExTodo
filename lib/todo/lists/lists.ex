defmodule Todo.Lists do
  alias Todo.Lists.Commands.{
    AddTodoItem
  }

  alias Todo.App

  def add_todo_item(attrs \\ %{}) do
    uuid = UUID.uuid4()

    add_todo_item =
      attrs
      |> AddTodoItem.new()
      |> AddTodoItem.assign()

    with :ok <- App.dispatch(add_todo_item) do
    end
  end
end
