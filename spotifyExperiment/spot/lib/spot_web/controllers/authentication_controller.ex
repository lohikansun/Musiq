defmodule SpotWeb.AuthenticationController do
  use SpotWeb, :controller

  def authenticate(conn, params) do
    case Spotify.Authentication.authenticate(conn, params) do
      {:ok, conn} ->
        redirect conn, to: "/search"
        {:error, reason, conn} ->
          redirect conn, to: "/authorize"
        end
  end

end
