defmodule Todo.Lists.Projectors.Item do
  use Commanded.Projections.Ecto,
    application: Todo.App,
    name: "Lists.Projectors.Items",
    consistency: :strong

  alias Todo.Lists.Events.{
    TodoItemAdded,
    TodoItemEdited
  }

  alias Todo.Lists.Projections.Item

  project(%TodoItemAdded{} = added, fn multi ->
    Ecto.Multi.insert(multi, :item, %Item{
      item_uuid: added.item_uuid,
      completed: false,
      list_uuid: added.list_uuid,
      task: added.task
    })
  end)

  project(%TodoItemEdited{} = edited, fn multi ->
    update_item(multi, edited.item_uuid, task: edited.new_task)
  end)

  defp update_item(multi, item_uuid, changes) do
    Ecto.Multi.update_all(multi, :item, item_query(item_uuid), set: changes)
  end

  defp item_query(uuid) do
    from(i in Item, where: i.item_uuid == ^uuid)
  end
end
