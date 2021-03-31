defmodule Todo.Lists do
  alias Todo.Lists.Commands.{
    AddTodoItem,
    EditTodoItem,
    CompleteTodoItem
  }

  alias Todo.App
  alias Todo.Lists.Projections.Item

  def add_todo_item(attrs \\ %{}) do
    uuid = UUID.uuid4()

    add =
      attrs
      |> AddTodoItem.new()
      |> AddTodoItem.assign_uuid(uuid)

    with :ok <- App.dispatch(add, consistency: :strong) do
      get(Item, uuid)
    end
  end

  def edit_todo_item(attrs \\ %{}) do
    %{item_uuid: uuid} = attrs

    edit = EditTodoItem.new(attrs)

    with :ok <- App.dispatch(edit, consistency: :strong) do
      get(Item, uuid)
    end
  end

  def complete_todo_item(attrs \\ %{}) do
    %{item_uuid: uuid} = attrs

    complete = CompleteTodoItem.new(attrs)

    with :ok <- App.dispatch(complete, consistency: :strong) do
      get(Item, uuid)
    end
  end

  defp get(schema, uuid) do
    case Todo.Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
