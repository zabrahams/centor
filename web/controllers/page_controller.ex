defmodule Centor.PageController do
  use Centor.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
