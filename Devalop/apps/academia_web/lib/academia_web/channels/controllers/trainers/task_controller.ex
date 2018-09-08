defmodule AcademiaWeb.TrainerTaskController do
  use AcademiaWeb, :controller

  alias Academia.Workshop

  def create(conn, params) do
    params = params["add_topic_task"]
    topic_id = params["topic_id"]

    case Workshop.add_topic_item(params) do
      {:ok, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
      {:error, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
    end
  end

  def update(conn, params) do
    task_id = params["id"]
    params = params["update_topic_task"]
    topic_id = params["topic_id"]

    case Workshop.update_topic_item(task_id, params) do
      {:ok, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
      {:error, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
    end
  end

  def delete(conn, %{"id" => task_id}) do
    case Workshop.delete_topic_item(task_id) do
      {:ok, topic_id, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
      {:error, topic_id, _} -> redirect(conn, to: "/trainers/topics/#{topic_id}")
    end
  end
end