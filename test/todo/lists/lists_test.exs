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

  describe "editing a todo item" do
    test "task can be edited" do
      list_uuid = UUID.uuid4()

      assert {:ok, %Item{} = new_item} =
               Lists.add_todo_item(%{
                 list_uuid: list_uuid,
                 task: "It works!"
               })

      assert new_item.list_uuid == list_uuid
      assert new_item.task == "It works!"

      assert {:ok, %Item{} = item} =
               Lists.edit_todo_item(%{
                 item_uuid: new_item.item_uuid,
                 new_task: "Editing works"
               })

      assert item.task == "Editing works"
    end
  end

  describe "completing a todo item" do
    test "succeeds when item is not complete" do
      list_uuid = UUID.uuid4()

      assert {:ok, %Item{} = item} =
               Lists.add_todo_item(%{list_uuid: list_uuid, task: "It works!"})

      assert item.list_uuid == list_uuid
      assert item.task == "It works!"

      assert {:ok, %Item{} = item} =
               Lists.complete_todo_item(%{
                 item_uuid: item.item_uuid
               })

      assert item.completed == true
    end
  end
end
