defmodule TimeTravelDemoWeb.PageLive do
  use TimeTravelDemoWeb, :live_view

  @list_ipsum ["Lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", "adipiscing",
 "elit,", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et",
 "dolore", "magna", "aliqua.", "Ut", "enim", "ad", "minim", "veniam,", "quis",
 "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex",
 "ea", "commodo", "consequat.", "Duis", "aute", "irure", "dolor", "in",
 "reprehenderit", "in", "voluptate", "velit", "esse", "cillum", "dolore", "eu",
 "fugiat", "nulla", "pariatur.", "Excepteur", "sint", "occaecat", "cupidatat",
 "non", "proident,", "sunt", "in", "culpa", "qui", "officia", "deserunt",
 "mollit", "anim", "id", "est", "laborum."]

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(TimeTravelDemo.PubSub, "time_travel")
    end

    {:ok, assign(socket, :items, [])}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div> Welcome to TimeTravelWeb Demo </div>

    <div>
      <span>List of random-ish items!</span>
      <button type="button" phx-click="add">Add an item</button>
      <button type="button" phx-click="remove">Remove last item</button>
      <ul>
        <%= for item <- @items do %>
          <li> <%= item %> </li>
        <% end %>
      </ul>
    </div>
    """
  end

  @impl true
  def handle_event("add", _params, socket) do
    %{items: items} = socket.assigns
    {:noreply, assign(socket, :items, items ++ Enum.take_random(@list_ipsum, 1))}
  end

  def handle_event("remove", _params, socket) do
    %{items: items} = socket.assigns
    {:noreply, assign(socket, :items, Enum.drop(items, -1))}
  end

  @impl true
  def handle_info({:time_travel, _socket_id, nil}, socket) do
    {:noreply, socket}
  end

  def handle_info({:time_travel, socket_id, assigns}, %{id: id} = socket) when id == socket_id do
    {:noreply, assign(socket, assigns)}
  end

  def handle_info({:time_travel, _socket_id, _assigns}, params, socket) do
    {:noreply, socket}
  end
end
