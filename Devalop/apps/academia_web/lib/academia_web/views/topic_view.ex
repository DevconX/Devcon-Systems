defmodule AcademiaWeb.TopicView do
  use AcademiaWeb, :view

  alias Academia.Repo
  alias Academia.Workshops.UserTask

  import Ecto.Query

  def get_task_id(conn, task_id) do
    Plug.Conn.fetch_session(conn)
    user_id = Plug.Conn.get_session(conn, :current_user).id
    query = from u in UserTask,
      where: u.user_id == ^user_id,
      where: u.topic_item_id == ^task_id
    task = Repo.one(query)
    task.id
  end

  def get_task_completion(conn, task_id) do
    Plug.Conn.fetch_session(conn)
    user_id = Plug.Conn.get_session(conn, :current_user).id
    query = from u in UserTask,
      where: u.user_id == ^user_id,
      where: u.topic_item_id == ^task_id
    task = Repo.one(query)
    task.is_completed
  end
end