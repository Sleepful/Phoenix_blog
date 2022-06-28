defmodule Blog.JournalFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Journal` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blog.Journal.create_post()

    post
  end
end
