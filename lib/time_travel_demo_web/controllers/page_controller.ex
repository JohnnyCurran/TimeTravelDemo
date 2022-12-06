defmodule TimeTravelDemoWeb.PageController do
  use TimeTravelDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
