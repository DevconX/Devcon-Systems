defmodule Academia.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :github_uid, :string
    field :email, :string
    field :full_name, :string
    field :avatar, :string

    timestamps()
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:github_uid, :email, :full_name, :avatar])
    |> validate_required([:github_uid, :email, :full_name, :avatar])
  end
end