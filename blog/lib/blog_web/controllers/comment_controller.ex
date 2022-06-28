defmodule BlogWeb.CommentController do
  use BlogWeb, :controller

  alias Blog.Repo
  alias Blog.Journal.Post
  alias Blog.Interaction
  alias Blog.Interaction.Comment

  def new(conn, _params) do
    changeset = Interaction.change_comment(%Comment{})
    render(conn, "new.html", changeset: changeset)
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

        # |> redirect(to: Routes.page_path(conn, :show, id))
        # BlogWeb.PageController.show(conn, %{changeset: changeset, comment_params: comment_params})
        id = comment_params["post_id"]
        post = Repo.get!(Post, id)
        comments = Blog.Interaction.list_comments(id)

        render(BlogWeb.PageView, "index.html",
          posts: [post],
          comments: comments,
          changeset: changeset,
          action: Routes.comment_path(conn, :create, id)
        )

        # render(conn, "new.html", changeset: changeset)
        # render(conn, "index.html", posts: [post], comments: comments, changeset: changeset, action: Routes.comment_path(conn, :create, id))
        # render(conn, "index.html", changeset: changeset)
        # render(conn, "index.html", changeset: changeset)
    end
  end
end
