defmodule Academia.Workshops.TopicItem do
  use Ecto.Schema

  import Ecto.Changeset

  schema "topic_items" do
    field :name, :string
    field :description, :string
    timestamps()

    belongs_to :topic, Academia.Workshops.Topic, foreign_key: :topic_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:name, :description, :topic_id])
    |> validate_required([:name, :description, :topic_id])
  end
end