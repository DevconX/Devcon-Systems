defmodule AcademiaWeb.PageController do
  use AcademiaWeb, :controller

  plug AcademiaWeb.Plug.Authenticated

  def index(conn, _params) do
    render conn, "index.html"
  end
end
