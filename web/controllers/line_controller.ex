defmodule Centor.LineController do
  use Centor.Web, :controller
  alias Centor.Line
  plug :scrub_params, "line" when action in [:create]

  def index(conn, _params) do
    lines = Repo.all(Line)
    render(conn, "index.html", lines: lines)
  end

  def new(conn, _params) do
    line = Line.changeset(%Line{})
    render(conn, "new.html", line: line)
  end

  def create(conn, %{"line" => line_params}) do
    changeset = Line.changeset(%Line{}, line_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Great Line!")
        |> redirect(to: line_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    line = Repo.get!(Line, id)
    Repo.delete!(line)

    conn
    |> put_flash(:info, "So long, sucka")
    |> redirect(to: line_path(conn, :index))
  end

end
