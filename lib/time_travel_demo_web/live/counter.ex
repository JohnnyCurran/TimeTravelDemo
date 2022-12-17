defmodule TimeTravelDemoWeb.Counter do
  use TimeTravelDemoWeb, :live_component

  @impl true
  def update(assigns, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span><%= @count %></span>
      <button phx-click="increment" phx-target={@myself}>Count Up</button>
      <button phx-click="decrement" phx-target={@myself}>Count Down</button>
    </div>
    """
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, & &1 + 1)}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, & &1 - 1)}
  end
end
