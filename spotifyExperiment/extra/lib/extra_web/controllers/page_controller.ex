defmodule ExtraWeb.PageController do
  use ExtraWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
