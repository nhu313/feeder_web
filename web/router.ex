defmodule FeederWeb.Router do
  use Phoenix.Router

  get "/", FeederWeb.PageController, :feeds, as: :pages
  get "/index", FeederWeb.PageController, :index, as: :pages
  get "/new", FeederWeb.PageController, :new, as: :pages
  post "/create", FeederWeb.PageController, :create
  get "/:id/delete", FeederWeb.PageController, :delete
end
