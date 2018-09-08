defmodule Academia.Repo.Migrations.CreateWorkshopTable do
  use Ecto.Migration

  def up do
    create table(:workshops) do
      add :name, :string
      add :slug, :string
      timestamps()
    end

    create table(:event_workshop) do
      add :event_id, references(:events)
      add :workshop_id, references(:workshops)
      timestamps()
    end
  end

  def down do
    drop table(:workshops)
    drop table(:event_workshop)
  end
end
