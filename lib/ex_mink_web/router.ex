defmodule ExMinkWeb.Router do
  use ExMinkWeb, :router

  forward("/health/live", Healthchex.Probes.Liveness)
  forward("/health/ready", Healthchex.Probes.Readiness)

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ExMinkWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExMinkWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/canines", CanineLive.Index, :index
    live "/canines/new", CanineLive.Index, :new
    live "/canines/:id/edit", CanineLive.Index, :edit

    live "/canines/:id", CanineLive.Show, :show
    live "/canines/:id/show/edit", CanineLive.Show, :edit
  end

  scope "/api", ExMinkWeb.Api, as: :api do
    pipe_through :api
    resources "/about", AboutController
    resources "/canines", CanineController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExMinkWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ExMinkWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
