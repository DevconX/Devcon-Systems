defmodule AcademiaWeb.LayoutView do
  use AcademiaWeb, :view

  def current_user(conn) do
    Plug.Conn.fetch_session(conn)
    Plug.Conn.get_session(conn, :current_user)
  end
end
