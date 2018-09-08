defmodule AcademiaWeb.TrainerWorkshopController do
  use AcademiaWeb, :controller

  alias Academia.Workshop

  def index(conn, _params) do
    workshops = Workshop.get_all_workshops()

    render(conn, "index.html", workshops: workshops)
  end

  def show(conn, %{"id" => workshop_slug}) do
    workshop = Workshop.get_workshop(workshop_slug)
    topics = Workshop.get_all_topics(workshop_slug)

    render(conn, "show.html", workshop: workshop, topics: topics)
  end
end