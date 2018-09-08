defmodule Academia.Workshop do
  import Ecto.Query

  alias Academia.Repo
  alias Academia.Workshops.{
    Event,
    EventWorkshop,
    Topic,
    TopicItem,
    Workshop,
    UserTask
  }

  def get_all_workshops(event_id \\ 1) do
    query = from ew in EventWorkshop,
      where: ew.event_id == ^event_id,
      preload: [:event, :workshop, :topics]
    Repo.all(query)
  end

  def get_workshop(workshop_slug),
    do: Repo.get_by(Workshop, slug: workshop_slug)

  def get_all_topics(event_workshop_slug) do
    workshop = Repo.get_by(Workshop, slug: event_workshop_slug)

    query = from t in Topic,
      where: t.workshop_event_id == ^workshop.id,
      preload: [:items, event_workshop: :workshop]
    Repo.all(query)
  end

  def get_topic(topic_id) do
    query = from t in Topic,
      where: t.id == ^topic_id,
      preload: [:items, event_workshop: :workshop]
    Repo.one(query)
  end

  def get_topic_items(topic_id) do
    query = from ti in TopicItem,
      where: ti.topic_id == ^topic_id,
      preload: [:topic]
    Repo.all(query)
  end

  def create_new_topic(%{"name" => _name, "workshop_event_id" => event_workshop_id} = params) do
    workshop = Repo.get(Workshop, event_workshop_id)

    changeset = Topic.changeset(%Topic{}, params)
    if changeset.valid? do
      case Repo.insert(changeset) do
        {:ok, topic} -> {:ok, workshop.slug, topic}
        {:error, changeset} -> {:error, workshop.slug, changeset.errors}
      end
    else
      {:error, workshop.slug, changeset.errors}
    end
  end

  def update_topic(topic_id, %{"name" => _name} = params) do
    topic = Repo.get(Topic, topic_id)
    workshop = Repo.get(Workshop, topic.workshop_event_id)

    changeset = Topic.changeset(topic, params)
    if changeset.valid? do
      case Repo.update(changeset) do
        {:ok, topic} -> {:ok, workshop.slug, topic}
        {:error, changeset} -> {:error, workshop.slug, changeset.errors}
      end
    else
      {:error, workshop.slug, changeset.errors}
    end
  end

  def delete_topic(topic_id) do
    query = from t in Topic,
      where: t.id == ^topic_id,
      preload: [:items, event_workshop: :workshop]
    topic = Repo.one(query)

    if length(topic.items) > 0 do
      Enum.map(topic.items, fn(item) -> Repo.delete(item) end)
    end

    case Repo.delete(topic) do
      {:ok, topic} -> {:ok, topic.event_workshop.workshop.slug, topic}
      {:error, changeset} -> {:error, topic.event_workshop.workshop.slug, changeset.errors}
    end
  end

  def add_topic_item(%{"topic_id" => _topic_id, "name" => _name, "description" => _desctiption} = params) do
    changeset = TopicItem.changeset(%TopicItem{}, params)
    if changeset.valid? do
      case Repo.insert(changeset) do
        {:ok, topic_item} -> {:ok, topic_item}
        {:error, changeset} -> {:error, changeset.errors}
      end
    else
      {:error, changeset.errors}  
    end
  end

  def update_topic_item(task_id, %{"name" => _name, "description" => _desctiption} = params) do
    task = Repo.get(TopicItem, task_id)
    changeset = TopicItem.changeset(task, params)
    if changeset.valid? do
      case Repo.update(changeset) do
        {:ok, topic_item} -> {:ok, topic_item}
        {:error, changeset} -> {:error, changeset.errors}
      end
    else
      {:error, changeset.errors}  
    end
  end

  def delete_topic_item(task_id) do
    task = Repo.get(TopicItem, task_id)
    case Repo.delete(task) do
      {:ok, topic_item} -> {:ok, task.topic_id, topic_item}
      {:error, changeset} -> {:error, task.topic_id, changeset.errors}
    end
  end

  def enroll_workshop(%{"user_id" => user_id, "topic_id" => topic_id} = params) do
    query = from u in UserTask,
      where: u.user_id == ^user_id,
      where: u.topic_id == ^topic_id
    enrolled = Repo.all(query)

    if length(enrolled) == 0 do
      topic = get_topic(topic_id)

      Enum.each(topic.items, fn(item) ->
        changeset = UserTask.changeset(%UserTask{}, Map.put(params, "topic_item_id", item.id))
        if changeset.valid? do
          Repo.insert(changeset)
        end
      end)
    end

    :ok
  end

  def completed_task(%{"id" => id} = params) do
    task = Repo.get(UserTask, id)
    IO.inspect task
    changeset = UserTask.changeset(task, %{"is_completed" => true})
    if changeset.valid? do
      Repo.update(changeset)
    end

    :ok
  end
end