defmodule ExtraWeb.AuthorizationController do
  use ExtraWeb, :controller

  def authorize(conn, params) do
    redirect conn, external: Spotify.Authorization.url
  end

end
