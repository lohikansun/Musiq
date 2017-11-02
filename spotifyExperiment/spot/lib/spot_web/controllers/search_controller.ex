defmodule SpotWeb.SearchController do
  use SpotWeb, :controller


  def index(conn, _params) do
    render conn, "index.html", items: []
  end

  def search(conn, %{"type" => type, "q" => q}) do
    {:ok, %{items: items}} = Spotify.Search.query(conn, q: q, type: type)
    render conn, "index.html", items: items
  end

end
