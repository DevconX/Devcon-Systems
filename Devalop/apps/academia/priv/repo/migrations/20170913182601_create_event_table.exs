defmodule Academia.Repo.Migrations.CreateEventTable do
  use Ecto.Migration

  def up do
    create table(:events) do
      add :name, :string
      add :event_date, :date
      timestamps()
    end
  end

  def down do
    drop table(:events)
  end
end
