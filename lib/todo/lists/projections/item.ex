defmodule Todo.Lists.Projections.Item do
  use Ecto.Schema

  @primary_key {:item_uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "lists_items" do
    field(:task, :string)
    field(:completed, :boolean)
    field(:list_uuid, :binary_id)

    timestamps()
  end
end
