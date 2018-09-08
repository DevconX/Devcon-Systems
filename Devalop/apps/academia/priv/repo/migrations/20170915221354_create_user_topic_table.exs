defmodule Academia.Repo.Migrations.CreateUserTopicTable do
  use Ecto.Migration

  def up do
    create table(:user_task) do
      add :user_id, references(:users)
      add :topic_id, references(:topics)
      add :topic_item_id, references(:topic_items)
      add :is_completed, :boolean, default: false
      timestamps()
    end
  end
end
