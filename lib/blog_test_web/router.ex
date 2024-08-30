defmodule BlogTestWeb.Router do
  use BlogTestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogTestWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/json" do
    pipe_through [:api]

    forward "/swaggerui",
            OpenApiSpex.Plug.SwaggerUI,
            path: "/api/json/open_api",
            default_model_expand_depth: 4

    forward "/", BlogTestWeb.AshJsonApiRouter
  end

  scope "/api", BlogTestWeb do
    pipe_through :api
  end
end
