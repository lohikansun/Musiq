
dule Spotify.Player do

  use Responder
  import Helpers

  def play(conn, params) do
    url = "https://api.spotify.com/v1/me/player/play "
    conn |> Client.get(url) |> handle_response
  end

  def build_response(body) do
    body
      |> map_paging
  end

  defp map_paging(body), do: {Paging.response(body, []), body}

end

