defmodule Academia.Application do
  @moduledoc """
  The Academia Application Service.

  The academia system business domain lives in this application.

  Exposes API to clients such as the `AcademiaWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Academia.Repo, []),
    ], strategy: :one_for_one, name: Academia.Supervisor)
  end
end
