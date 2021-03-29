defmodule Todo.Repo.Migrations.AddItemProjection do
  use Ecto.Migration

  def change do
    create table(:lists_items, primary_key: false) do
      add(:item_uuid, :uuid, primary_key: true)
      add(:list_uuid, :uuid)
      add(:task, :string)
      add(:completed, :boolean)

      timestamps()
    end
  end
end
