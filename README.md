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

# Preview (Screenshots)

<img width="810" alt="Screen Shot 2022-06-28 at 15 00 45" src="https://user-images.githubusercontent.com/7144046/176287449-7476ba95-795b-4134-b00f-0fc0eef4abe1.png">
<img width="810" alt="Screen Shot 2022-06-28 at 15 01 09" src="https://user-images.githubusercontent.com/7144046/176287206-76937996-a79d-467f-bcd1-d551186831d1.png">
<img width="810" alt="Screen Shot 2022-06-28 at 15 01 17" src="https://user-images.githubusercontent.com/7144046/176287188-fa7b0edd-7c89-4a3c-a5d5-b5f47cdc8f56.png">
<img width="810" alt="Screen Shot 2022-06-28 at 15 01 25" src="https://user-images.githubusercontent.com/7144046/176287163-afd7770d-6333-4995-8521-f4652015ec90.png">
<img width="810" alt="Screen Shot 2022-06-28 at 15 01 39" src="https://user-images.githubusercontent.com/7144046/176287167-9b4b3698-5506-4b91-aebe-f21c4c8df252.png">




# Preview (GIF)

![2022-06-28 14 40 25](https://user-images.githubusercontent.com/7144046/176285941-cdbfd1ff-4d89-4751-bab0-09913712d6fb.gif)
