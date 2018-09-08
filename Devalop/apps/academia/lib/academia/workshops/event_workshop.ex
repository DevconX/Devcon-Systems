defmodule Academia.Workshops.EventWorkshop do
  use Ecto.Schema

  import Ecto.Changeset

  schema "event_workshop" do
    belongs_to :event, Academia.Workshops.Event, foreign_key: :event_id
    belongs_to :workshop, Academia.Workshops.Workshop, foreign_key: :workshop_id
    timestamps()

    has_many :topics, Academia.Workshops.Topic, foreign_key: :workshop_event_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:event_id, :workshop_id])
    |> validate_required([:event_id, :workshop_id])
  end
end