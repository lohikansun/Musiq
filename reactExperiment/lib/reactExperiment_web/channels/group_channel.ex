defmodule ReactExperimentWeb.GroupChannel do
  use ReactExperimentWeb, :channel
  alias ReactExperiment.Group
  def join("group:" <> username, payload, socket) do
    if authorized?(socket, username) do
      group = Group.new()
      socket = socket
      |> assign(:group, group)
      |> assign(:name, username)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("guess", %{"letter" => ll}, socket) do
      group = Group.guess(socket.assigns[:group], ll)
      socket = assign(socket, :group, groups)
    {:reply, {:ok, Group.client_view(group)}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (group:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(socket, name) do
    socket.assigns[:username] == name
  end
end
