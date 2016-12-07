defmodule Trollo.Router do
  use Trollo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", Trollo do
    pipe_through :browser # Use the default browser stack

    get "*path", PageController, :index
  end

  scope "/api", Trollo do
    pipe_through :api

    scope "/v1" do
      post "/registrations", RegistrationController, :create
      post "/sessions", SessionsController, :create
      delete "/sessions", SessionsController, :delete
      get "/current_user", CurrentUserController, :show
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Trollo do
  #   pipe_through :api
  # end
end
