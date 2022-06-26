defmodule Blog.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table("posts") do
      add :title, :string, size: 100
      add :body, :string, size: 10_000

      timestamps()
    end
  end
end
