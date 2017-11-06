defmodule ReactExperimentWeb.PageController do
  use ReactExperimentWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
