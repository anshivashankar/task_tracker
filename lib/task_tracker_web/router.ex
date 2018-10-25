defmodule TaskTrackerWeb.Router do
  use TaskTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TaskTrackerWeb.Plugs.FetchSession
  end

  # Below pipeline inspired by: http://www.ccs.neu.edu/home/ntuck/courses/2018/09/cs4550/notes/13-ajax/notes.html
  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug TaskTrackerWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TaskTrackerWeb do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
    get "/", PageController, :index
  end

  # Below scope inspired by: http://www.ccs.neu.edu/home/ntuck/courses/2018/09/cs4550/notes/13-ajax/notes.html
  scope "/ajax", TaskTrackerWeb do
    pipe_through :ajax
    resources "/timeblock", TimeBlockController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TaskTrackerWeb do
  #   pipe_through :api
  # end
end
