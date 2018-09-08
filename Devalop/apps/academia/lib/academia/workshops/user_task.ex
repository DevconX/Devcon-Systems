defmodule Academia.Workshops.UserTask do
  use Ecto.Schema

  import Ecto.Changeset

  schema "user_task" do
    field :is_completed, :boolean
    timestamps()

    belongs_to :user, Academia.User, foreign_key: :user_id
    belongs_to :topic, Academia.Workshops.Topic, foreign_key: :topic_id
    belongs_to :topic_item, Academia.Workshops.TopicItem, foreign_key: :topic_item_id
  end

  def changeset(changeset, params \\ %{}) do
    changeset
    |> cast(params, [:user_id, :topic_id, :topic_item_id, :is_completed])
    |> validate_required([:user_id, :topic_id, :topic_item_id])
  end
end