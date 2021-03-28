defmodule Todo.Repo.Migrations.AddItemProjection do
  use Ecto.Migration

  def change do
    create table(:list_items, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)
      add(:list_uuid, :uuid)
      add(:task, :string)

      timestamps()
    end
  end
end
