defmodule BlogTestWeb.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, File.read!(Application.app_dir(:blog_test, "priv/static/index.html")))
  end
end