defmodule Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> validate_length(:title, max: 100)
    |> validate_length(:title, min: 5)
    |> validate_length(:body, max: 10_000)
    |> validate_length(:body, min: 5)
  end
end
