defmodule Todo.Lists do
  alias Todo.Lists.Commands.{
    AddTodoItem,
    EditTodoItem
  }

  alias Todo.App
  alias Todo.Lists.Projections.Item

  def add_todo_item(attrs \\ %{}) do
    uuid = UUID.uuid4()

    add_todo_item =
      attrs
      |> AddTodoItem.new()
      |> AddTodoItem.assign_uuid(uuid)
      |> AddTodoItem.assign_task()
      |> AddTodoItem.assign_list_uuid()

    with :ok <- App.dispatch(add_todo_item, consistency: :strong) do
      get(Item, uuid)
    end
  end

  def edit_todo_item(attrs \\ %{}) do
    %{item_uuid: uuid} = attrs

    edit_todo_item =
      attrs
      |> EditTodoItem.new()
      |> EditTodoItem.assign_uuid()
      |> EditTodoItem.assign_task()

    with :ok <- App.dispatch(edit_todo_item, consistency: :strong) do
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
