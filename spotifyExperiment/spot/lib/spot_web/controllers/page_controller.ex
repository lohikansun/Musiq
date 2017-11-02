defmodule SpotWeb.PageController do
  use SpotWeb, :controller

  def index(conn, _params) do
    render conn, to: "/auth"
  end
end
