defmodule Todo.Lists.Supervisor do
  use Supervisor

  alias Todo.Lists

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init(
      [
        Lists.Projectors.Item
      ],
      strategy: :one_for_one
    )
  end
end
