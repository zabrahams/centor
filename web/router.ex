defmodule Centor.Router do
  use Centor.Web, :router

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

  scope "/", Centor do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/lines", LineController, except: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Centor do
  #   pipe_through :api
  # end
end
