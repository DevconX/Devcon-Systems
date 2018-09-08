defmodule Academia.Workshops.Event do
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :event_date, :date
    timestamps()

    has_many :workshops, Academia.Workshops.EventWorkshop, foreign_key: :event_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:name, :event_date])
    |> validate_required([:name, :event_date])
  end
end