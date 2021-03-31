defmodule Todo.Lists.Aggregates.TodoItem do
  defstruct uuid: nil,
            task: nil,
            completed?: false,
            deleted?: false,
            list_uuid: nil

  alias Todo.Lists.Aggregates.TodoItem

  alias Todo.Lists.Commands.{
    AddTodoItem,
    CompleteTodoItem,
    # UncompleteTodoItem,
    EditTodoItem
    # DeleteTodoItem
  }

  alias Todo.Lists.Events.{
    TodoItemAdded,
    TodoItemCompleted,
    # TodoItemUncompleted,
    TodoItemEdited
    # TodoItemDeleted
  }

  def execute(%TodoItem{uuid: nil}, %AddTodoItem{} = add) do
    %TodoItemAdded{
      item_uuid: add.item_uuid,
      task: add.task,
      list_uuid: add.list_uuid
    }
  end

  def execute(%TodoItem{completed?: false}, %EditTodoItem{} = edit) do
    %TodoItemEdited{
      item_uuid: edit.item_uuid,
      new_task: edit.new_task
    }
  end

  def execute(%TodoItem{completed?: true}, %EditTodoItem{}), do: nil

  def execute(%TodoItem{completed?: false}, %CompleteTodoItem{} = complete) do
    %TodoItemCompleted{
      item_uuid: complete.item_uuid
    }
  end

  def execute(%TodoItem{completed?: true}, %CompleteTodoItem{}), do: nil

  def apply(%TodoItem{} = item, %TodoItemAdded{} = added) do
    %TodoItem{
      item
      | uuid: added.item_uuid,
        task: added.task,
        list_uuid: added.list_uuid
    }
  end

  def apply(%TodoItem{} = item, %TodoItemEdited{new_task: new_task}) do
    %TodoItem{
      item
      | task: new_task
    }
  end

  def apply(%TodoItem{} = item, %TodoItemCompleted{}) do
    %TodoItem{
      item
      | completed?: true
    }
  end
end
