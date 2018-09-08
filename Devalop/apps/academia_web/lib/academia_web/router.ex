defmodule AcademiaWeb.Router do
  use AcademiaWeb, :router

  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  scope "/auth", AcademiaWeb do
    pipe_through [:browser]
    
    get "/login", AuthController, :index
    get "/logout", AuthController, :logout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  scope "/trainers", AcademiaWeb do
    pipe_through [:browser]
    
    resources "/workshops", TrainerWorkshopController
    resources "/topics", TrainerTopicController
    resources "/tasks", TrainerTaskController
  end

  scope "/", AcademiaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/workshops", WorkshopController
    resources "/topics", TopicController
    resources "/tasks", TaskController
  end

  scope "/api", AcademiaWeb do
    pipe_through :api

    put "/tasks/completed", TopicController, :update
  end
end
