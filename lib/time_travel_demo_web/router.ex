defmodule TimeTravelDemoWeb.Router do
  use TimeTravelDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TimeTravelDemoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimeTravelDemoWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimeTravelDemoWeb do
  #   pipe_through :api
  # end
end
