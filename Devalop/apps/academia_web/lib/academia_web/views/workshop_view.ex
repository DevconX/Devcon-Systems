defmodule AcademiaWeb.WorkshopView do
  use AcademiaWeb, :view

  def get_image_path(image_file) do
    {:ok, path} = File.cwd()
    "#{path}/apps/academia_web/priv/static/images/trainers/#{image_file}"
  end
end