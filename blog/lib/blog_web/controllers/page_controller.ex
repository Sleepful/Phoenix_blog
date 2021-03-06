defmodule BlogWeb.PageController do
  use BlogWeb, :controller
  alias Blog.Repo
  alias Blog.Journal.Post
  alias Blog.Interaction
  alias Blog.Interaction.Comment
  import Ecto.Query

  # index action
  def index(conn, _params) do
    posts = Repo.all(from p in Post, select: %{:id => p.id, :body => p.body, :title => p.title})

    posts =
      posts
      |> Enum.map(
        &(Map.get_and_update(&1, :body, fn val ->
            {val, String.slice(val, 0, 50)}
          end)
          |> elem(1))
      )

    IO.inspect(posts)
    render(conn, "index.html", posts: posts)
  end

  def create(conn, %{"comment" => comment_params, "id" => id}) do
    IO.inspect(conn)
    IO.inspect(comment_params)
    comment_params = Map.put(comment_params, "post_id", id)

    case Interaction.create_comment(comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.page_path(conn, :show, id))

      {:error, %Ecto.Changeset{} = changeset} ->
        err = Enum.at(changeset.errors, 0)
        {atom, {txt, _v}} = err
        msg = "Error in comment: " <> Atom.to_string(atom) <> " " <> txt

        conn
        |> put_flash(:error, msg)

        id = comment_params["post_id"]
        post = Repo.get!(Post, id)
        comments = Blog.Interaction.list_comments(id)

        render(conn, "index.html",
          posts: [post],
          comments: comments,
          changeset: changeset,
          action: Routes.page_path(conn, :create, id)
        )
    end
  end

  def show(conn, params) do
    id = params["id"]
    post = Repo.get!(Post, id)
    comments = Blog.Interaction.list_comments(id)
    changeset = Interaction.change_comment(%Comment{})

    render(conn, "index.html",
      posts: [post],
      comments: comments,
      changeset: changeset,
      action: Routes.page_path(conn, :create, id)
      # action: Routes.comment_path(conn, :create, id)
    )
  end
end
