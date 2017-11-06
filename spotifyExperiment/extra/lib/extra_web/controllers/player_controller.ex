require IEx
defmodule ExtraWeb.PlayerController do
  use ExtraWeb, :controller


  def index(conn, _params) do
    render conn, "index.html", items: []
  end

  def play(conn, params) do
    Spotify.Player.play(conn, params)
    conn
    |> put_flash(:info, "Music Played")
    |> redirect(to: player_path(conn, :index))

  end

  def pause(conn, params) do
    Spotify.Player.pause(conn, params)
    conn
    |> put_flash(:info, "Music Paused")
    |> redirect(to: player_path(conn, :index))
  end

end
