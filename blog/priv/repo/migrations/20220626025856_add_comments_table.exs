defmodule Blog.Repo.Migrations.AddCommentsTable do
  use Ecto.Migration

  def change do
    create table("comments") do
      add :email, :string, size: 50
      add :body, :string, size: 600
      add :post_id, references("posts")

      timestamps()
    end

  end
end
