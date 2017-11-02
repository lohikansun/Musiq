defmodule SpotWeb.AuthorizationController do
  use SpotWeb, :controller

  def authorize(conn, params) do
    redirect conn, external: Spotify.Authorization.url
  end

end
