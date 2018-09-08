defmodule Academia.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :github_uid, :string
      add :email, :string
      add :full_name, :string
      add :avatar, :string
      timestamps()
    end
  end

  def down do
    drop table(:users)
  end
end
