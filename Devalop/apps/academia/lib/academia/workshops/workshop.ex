defmodule Academia.Workshops.Workshop do
  use Ecto.Schema

  import Ecto.Changeset

  schema "workshops" do
    field :name, :string
    field :slug, :string
    timestamps()

    has_many :workshops, Academia.Workshops.EventWorkshop, foreign_key: :workshop_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end