defmodule Academia.Repo.Migrations.CreateTopicTable do
  use Ecto.Migration

  def up do
    create table(:topics) do
      add :name, :string
      add :workshop_event_id, references(:event_workshop)
      timestamps()
    end

    create table(:topic_items) do
      add :topic_id, references(:topics)
      add :name, :string
      add :desctiption, :string
      timestamps()
    end
  end

  def down do
    drop table(:topic_items)
    drop table(:topics)
  end
end
