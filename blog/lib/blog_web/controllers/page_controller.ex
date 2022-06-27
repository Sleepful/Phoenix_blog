defmodule BlogWeb.PageController do
  use BlogWeb, :controller
  alias Blog.{Repo, Post}
  import Ecto.Query

  # index action
  def index(conn, _params) do
    posts = Repo.all(from p in Post, select: %{:id => p.id, :body => p.body, :title => p.title})
    IO.inspect(posts)
    render(conn, "index.html", posts: posts)
  end
end
