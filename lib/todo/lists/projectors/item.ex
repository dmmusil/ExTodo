defmodule Todo.Lists.Projectors.Item do
  use Commanded.Projections.Ecto,
    application: Todo.App,
    name: "Lists.Projectors.Items",
    consistency: :strong

  alias Todo.Lists.Events.{
    TodoItemAdded
  }

  alias Todo.Lists.Projections.Item

  project(%TodoItemAdded{} = added, fn multi ->
    IO.puts("inserting")

    Ecto.Multi.insert(multi, :item, %Item{
      item_uuid: added.item_uuid,
      completed: false,
      list_uuid: added.list_uuid,
      task: added.task
    })
  end)
end
