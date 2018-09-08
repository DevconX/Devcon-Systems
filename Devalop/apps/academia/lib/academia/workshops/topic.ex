defmodule Academia.Workshops.Topic do
  use Ecto.Schema

  import Ecto.Changeset

  schema "topics" do
    field :name, :string
    timestamps()

    has_many :items, Academia.Workshops.TopicItem, foreign_key: :topic_id
    belongs_to :event_workshop, Academia.Workshops.EventWorkshop, foreign_key: :workshop_event_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:name, :workshop_event_id])
    |> validate_required([:name, :workshop_event_id])
  end
end