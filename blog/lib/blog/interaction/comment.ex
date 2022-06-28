defmodule Blog.Interaction.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :email, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:email, :body, :post_id])
    |> validate_required([:email, :body, :post_id])
    |> validate_length(:email, max: 50)
    |> validate_length(:email, min: 5)
    |> validate_length(:body, max: 600)
    |> validate_length(:body, min: 5)
    |> validate_format(:email, ~r/@/)
  end
end
