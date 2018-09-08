defmodule AcademiaWeb.Plug.Authenticated do
  import Plug.Conn

  def init(opts),
    do: opts

  def call(conn, _) do
    if is_nil(get_session(conn, :current_user)) do
      Phoenix.Controller.redirect(conn, to: "/auth/login")
    else
      conn
    end
  end
end