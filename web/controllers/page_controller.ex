defmodule Trollo.PageController do
  use Trollo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
