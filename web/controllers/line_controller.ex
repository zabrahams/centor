defmodule Centor.LineController do
  use Centor.Web, :controller
  alias Centor.Line


  def index(conn, _params) do
    lines = Repo.all(Line)
    render(conn, "index.html", lines: lines)
  end
end
