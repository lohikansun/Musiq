require IEx
defmodule ExtraWeb.SearchController do
  use ExtraWeb, :controller


  def index(conn, _params) do
    render conn, "index.html", items: []
  end

  def search(conn, %{"q" => q}) do
    {:ok, %{items: items}} = Spotify.Search.query(conn, q: q, type: "track")
    render conn, "index.html", items: items
  end

  def play(conn, params) do
    Spotify.Player.play(conn, params)
    conn
  end

end
