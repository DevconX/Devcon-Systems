defmodule AcademiaWeb.TopicController do
  use AcademiaWeb, :controller

  alias Academia.Workshop

  def show(conn, %{"id" => topic_id}) do
    user_id = Plug.Conn.get_session(conn, :current_user).id
    Workshop.enroll_workshop(%{"user_id" => user_id, "topic_id" => topic_id})

    topic = Workshop.get_topic(topic_id)

    render(conn, "show.html", topic: topic)
  end

  def update(conn, %{"id" => _id} = params) do
    Workshop.completed_task(params)

    send_resp(conn, :no_content, "")
  end
end