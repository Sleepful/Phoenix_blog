defmodule Blog.InteractionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Interaction` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        email: "some email"
      })
      |> Blog.Interaction.create_comment()

    comment
  end
end
