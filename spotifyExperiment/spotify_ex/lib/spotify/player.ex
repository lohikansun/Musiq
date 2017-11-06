require IEx
defmodule Spotify.Player do

  use Responder
  import Helpers

  alias Spotify.{Client, Album, Artist, Playlist, Track}

  def play(conn, params) do
    url = "https://api.spotify.com/v1/me/player/play"
    conn |> Client.put(url) |> handle_response
  end

  def pause(conn, params) do
    url = "https://api.spotify.com/v1/me/player/pause"
    conn |> Client.put(url) |> handle_response
  end

  def build_response(body), do: body

end
