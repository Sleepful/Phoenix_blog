defmodule Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Journal.Post

  schema "comments" do
    field :body, :string
    field :email, :string
    # field :post_id, :id
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:email, :body])
    |> validate_required([:email, :body])
    |> validate_length(:email, max: 50)
    |> validate_length(:email, min: 5)
    |> validate_length(:body, max: 600)
    |> validate_length(:body, min: 5)
    |> validate_format(:email, ~r/@/)
  end
end
