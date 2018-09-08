defmodule AcademiaWeb.TrainerTopicController do
  use AcademiaWeb, :controller

  alias Academia.Workshop

  def show(conn, %{"id" => topic_id}) do
    topic = Workshop.get_topic(topic_id)

    render(conn, "show.html", topic: topic)
  end

  def create(conn, params) do
    params = params["add_topic"]

    case Workshop.create_new_topic(params) do
      {:ok, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
      {:error, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
    end
  end

  def update(conn, params) do
    topic_id = params["id"]
    params = params["update_topic"]

    case Workshop.update_topic(topic_id, params) do
      {:ok, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
      {:error, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    case Workshop.delete_topic(topic_id) do
      {:ok, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
      {:error, workshop_slug, _} -> redirect(conn, to: "/trainers/workshops/#{workshop_slug}")
    end
  end
end