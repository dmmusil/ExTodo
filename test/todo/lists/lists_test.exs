defmodule Todo.ListsTest do
  use Todo.DataCase

  alias Todo.Lists
  alias Todo.Lists.Projections.Item

  describe "create todo list item" do
    test "create is successful" do
      list_uuid = UUID.uuid4()

      assert {:ok, %Item{} = item} =
               Lists.add_todo_item(%{list_uuid: list_uuid, task: "It works!"})

      assert item.list_uuid == list_uuid
      assert item.task == "It works!"
    end
  end
end
