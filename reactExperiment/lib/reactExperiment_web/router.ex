defmodule ReactExperimentWeb.Router do
  use ReactExperimentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :set_user
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReactExperimentWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  def set_user(conn, _params) do
      user = "jake"
      token = Phoenix.Token.sign(ReactExperimentWeb.Endpoint, "username", user)
      conn
      |> assign(:user_name, user)
      |> assign(:user_token, token)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReactExperimentWeb do
  #   pipe_through :api
  # end
end
