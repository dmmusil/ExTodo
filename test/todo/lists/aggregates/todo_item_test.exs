defmodule Todo.Lists.TodoItemTest do
  use Todo.AggregateCase, aggregate: Todo.Lists.Aggregates.TodoItem

  alias Todo.Lists.Commands.AddTodoItem
  alias Todo.Lists.Events.TodoItemAdded

  describe "add a todo item" do
    test "should succeed" do
      todo_uuid = UUID.uuid4()
      list_uuid = UUID.uuid4()

      assert_events(
        %AddTodoItem{
          item_uuid: todo_uuid,
          task: "do something",
          list_uuid: list_uuid
        },
        [
          %TodoItemAdded{
            item_uuid: todo_uuid,
            task: "do something",
            list_uuid: list_uuid
          }
        ]
      )
    end
  end
end
