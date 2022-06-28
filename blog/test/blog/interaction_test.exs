defmodule Blog.InteractionTest do
  use Blog.DataCase

  alias Blog.Interaction

  describe "comments" do
    alias Blog.Interaction.Comment

    import Blog.InteractionFixtures

    @invalid_attrs %{body: nil, email: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Interaction.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Interaction.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{body: "some body", email: "some email"}

      assert {:ok, %Comment{} = comment} = Interaction.create_comment(valid_attrs)
      assert comment.body == "some body"
      assert comment.email == "some email"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interaction.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{body: "some updated body", email: "some updated email"}

      assert {:ok, %Comment{} = comment} = Interaction.update_comment(comment, update_attrs)
      assert comment.body == "some updated body"
      assert comment.email == "some updated email"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Interaction.update_comment(comment, @invalid_attrs)
      assert comment == Interaction.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Interaction.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Interaction.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Interaction.change_comment(comment)
    end
  end
end
