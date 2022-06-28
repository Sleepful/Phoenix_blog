# README

This is a little blog-app with Elixir and Phoenix

Here is the rundown:

- Home page which lists blog-posts with title and body in a summarized manner.
- Clicking on a blog-post will take you to the page where you can view the full text of the blog-post.
- On the full blog-post page you may see comments left by other users below the post.
- On the full blog-post page you may add a comment with your email and the body of the comment.
- An admin route is available in which you can view the full list of posts and do the following operations:
  - Create new post
  - Edit post
  - Delete post
  - Show post
  
- All of the input forms have ecto changeset validations.

# Pre-requisites

- Elixir (with `mix` utility)
- PostgreSQL

# Running the app

```
# run commands from the root folder
$ cd ./blog
# install dependencies:
$ mix deps.get
# create the PostgreSQL Database
$ mix ecto.create
# run the database migrations:
$ mix ecto.migrate
# start the server:
$ mix phx.server

```

# Preview

![2022-06-28 14 40 25](https://user-images.githubusercontent.com/7144046/176285941-cdbfd1ff-4d89-4751-bab0-09913712d6fb.gif)]
